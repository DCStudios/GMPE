/// GMPE_UseSlice9( slice9_id, width, height )
/*
    Creates a sprite from a slice9 structure.
    Returns the sprite's id.
*/

//  --  Validate the arguments

    if( argument_count != 3 ) { GMPE_Error( "GMPE_UseSlice9", "Wrong number of arguments!" ); exit; }
    else if( !is_array( argument[0] ) ) { GMPE_Error( "GMPE_UseSlice9", "The provided slice9_id is invalid!" ); exit; }

//  --  Get the arguments

    var S,W,H,L,R,T,B,SW,SH,CW,CH;
    S = argument[0];
    W = argument[1];
    H = argument[2];
    L = S[GMPE_SLICE9_LEFT];
    R = S[GMPE_SLICE9_RIGHT];
    T = S[GMPE_SLICE9_TOP];
    B = S[GMPE_SLICE9_BOTTOM];
    SW = S[GMPE_SLICE9_SW];
    SH = S[GMPE_SLICE9_SH];
    CW = SW - ( L+R );
    CH = SH - ( T+B );
    
//  --  Create a temporary surface

    var i,j,SU = surface_create( W,H );
    surface_set_target( SU );
    
        draw_set_alpha( 1 );
        draw_set_color( c_white );
        draw_set_blend_mode_ext( bm_one,bm_zero );
        
        draw_sprite( S[GMPE_SLICE9_TL],0,0,0 );
        for( i=0; i<W-R; i+=CW ) draw_sprite( S[GMPE_SLICE9_T],0,L+i,0 );
        draw_sprite( S[GMPE_SLICE9_TR],0,W-R,0 );
        for( i=0; i<H-B; i+=CH ) draw_sprite( S[GMPE_SLICE9_L],0,0,T+i );
        for( i=0; i<W-R; i+=CW ) {
            for( j=0; j<H-B; j+=CH ) {
                draw_sprite( S[GMPE_SLICE9_C],0,L+i,T+j );
            }
        }
        for( i=0; i<H-B; i+=CH ) draw_sprite( S[GMPE_SLICE9_R],0,W-R,T+i );   
        draw_sprite( S[GMPE_SLICE9_BL],0,0,H-B );                              
        for( i=0; i<W-R; i+=CW ) draw_sprite( S[GMPE_SLICE9_B],0,L+i,H-B );    
        draw_sprite( S[GMPE_SLICE9_BR],0,W-R,H-B );   
        
        draw_set_blend_mode( bm_normal );
        
    surface_reset_target();
    
//  --  Create a sprite from the surface

    var SPR = sprite_create_from_surface( SU,0,0,W,H,false,false,0,0 );
    
//  --  Free the temporary surface

    surface_free( SU );
    
//  --  Return the created sprite

    return SPR;
