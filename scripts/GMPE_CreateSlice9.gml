/// GMPE_CreateSlice9( sprite_index, sub_image, left, right, top, bottom )
/*
    Creates a slice9 structure to be used with further drawings.
    Returns the handle of an array ( the structure )
*/

//  --  Validate argument count

    if( argument_count != 6 ) { GMPE_Error( "GMPE_CreateSlice9", "Wrong number of arguments!" ); exit; }

//  --  Load the arguments

    var i,j,S,I,L,R,T,B,W,H,SW,SH,CW,CH;
    S = argument[0];                // sprite_index
    I = argument[1]                 // sub_image
    L = argument[2];                // left
    R = argument[3];                // right
    T = argument[4];                // top
    B = argument[5];                // bottom
    SW = sprite_get_width( S );     // Width of the sprite
    SH = sprite_get_height( S );    // Height of the sprite
    CW = SW - ( L+R );
    CH = SH - ( T+B );
    
//  --  Validate dimensions

    if( CW <= 0 ) { GMPE_Error( "GMPE_CreateSlice9", "Dimensions are invalid!" ); exit; }
    else if( CH <= 0 ) { GMPE_Error( "GMPE_CreateSlice9", "Dimensions are invalid!" ); exit; }
    
//  --  Decompose the sprite on multiple surfaces

    var sTL,sT,sTR,sL,sC,sR,sBL,sB,sBR;

    draw_set_color( c_white );
    draw_set_alpha( 1 );
    draw_set_blend_mode_ext( bm_one, bm_zero );
    
    //    Create Surface             Target Surface                 Clear Surface            Draw on Surface                       Reset Target
    sTL = surface_create( L,T );  surface_set_target( sTL ); draw_clear_alpha( c_black,0 ); draw_sprite( S,I,0,0 );           surface_reset_target(); // Top left
    sT = surface_create( CW,T );  surface_set_target( sT );  draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-L,0 );          surface_reset_target(); // Top
    sTR = surface_create( R,T );  surface_set_target( sTR ); draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-SW+R-1,0 );     surface_reset_target(); // Top right
    sL = surface_create( L,CH );  surface_set_target( sL );  draw_clear_alpha( c_black,0 ); draw_sprite( S,I,0,-T );          surface_reset_target(); // Left
    sC = surface_create( CW,CH ); surface_set_target( sC );  draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-L,-T );         surface_reset_target(); // Center
    sR = surface_create( R,CH );  surface_set_target( sR );  draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-SW+R-1,-T );    surface_reset_target(); // Right
    sBL = surface_create( L,T );  surface_set_target( sBL ); draw_clear_alpha( c_black,0 ); draw_sprite( S,I,0,-SH+B );       surface_reset_target(); // Top left
    sB = surface_create( CW,T );  surface_set_target( sB );  draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-L,-SH+B );      surface_reset_target(); // Top
    sBR = surface_create( R,T );  surface_set_target( sBR ); draw_clear_alpha( c_black,0 ); draw_sprite( S,I,-SW+R-1,-SH+B ); surface_reset_target(); // Top right
    
//  --  Convert the surfaces to sprites ( so they can be kept )

    var slice=0;
    slice[GMPE_SLICE9_LEFT] = L;
    slice[GMPE_SLICE9_RIGHT] = R;
    slice[GMPE_SLICE9_TOP] = T;
    slice[GMPE_SLICE9_BOTTOM] = B;
    slice[GMPE_SLICE9_SW] = SW;
    slice[GMPE_SLICE9_SH] = SH;
    
    slice[GMPE_SLICE9_TL] = sprite_create_from_surface( sTL,0,0,surface_get_width(sTL),surface_get_height(sTL),false,false,0,0 );
    slice[GMPE_SLICE9_T] = sprite_create_from_surface( sT,0,0,surface_get_width(sT),surface_get_height(sT),false,false,0,0 );
    slice[GMPE_SLICE9_TR] = sprite_create_from_surface( sTR,0,0,surface_get_width(sTR),surface_get_height(sTR),false,false,0,0 );
    slice[GMPE_SLICE9_L] = sprite_create_from_surface( sL,0,0,surface_get_width(sL),surface_get_height(sL),false,false,0,0 );
    slice[GMPE_SLICE9_C] = sprite_create_from_surface( sC,0,0,surface_get_width(sC),surface_get_height(sC),false,false,0,0 );
    slice[GMPE_SLICE9_R] = sprite_create_from_surface( sR,0,0,surface_get_width(sR),surface_get_height(sR),false,false,0,0 );
    slice[GMPE_SLICE9_BL] = sprite_create_from_surface( sBL,0,0,surface_get_width(sBL),surface_get_height(sBL),false,false,0,0 );
    slice[GMPE_SLICE9_B] = sprite_create_from_surface( sB,0,0,surface_get_width(sB),surface_get_height(sB),false,false,0,0 );
    slice[GMPE_SLICE9_BR] = sprite_create_from_surface( sBR,0,0,surface_get_width(sBR),surface_get_height(sBR),false,false,0,0 );
    
//  --  Free all the surfaces

    surface_free( sTL );
    surface_free( sT );
    surface_free( sTR );
    surface_free( sL );
    surface_free( sC );
    surface_free( sR );
    surface_free( sBL );
    surface_free( sB );
    surface_free( sBR );
    
//  --  Return the created slice9 structure

    return slice;
