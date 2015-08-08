//  --  Prepare surface

    // Free/Create the surface
    if( surface_exists( surface ) ) surface_free( surface );
    surface = surface_create( width,height );
    
    // Erase the surface
    surface_set_target( surface );
    draw_clear_alpha( c_black, 0 );
    draw_set_alpha( 1 );
    
//  --  Render background

    GMPE_DrawButton();
    
//  --  Create sprite from surface

    surface_reset_target();
    if( sprite_index != noone ) sprite_delete( sprite_index );
    sprite_index = sprite_create_from_surface( surface, 0,0,width,height,false,false,0,0 );
    surface_free( surface );
    
show_debug_message( "[ GMPE_Button ]: Rendered!" );
    
