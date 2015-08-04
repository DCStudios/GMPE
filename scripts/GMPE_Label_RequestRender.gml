//  --  Prepare surface

    // Calculate the dimensions of the surface
    var fullWidth,fullHeight;
    fullWidth = width+padding_left+padding_right+border_size*2;
    fullHeight = height+padding_top+padding_bottom+border_size*2

    // Free/Create the surface
    if( surface_exists( surface ) ) surface_free( surface );
    surface = surface_create( fullWidth, fullHeight );
    
    // Erase the surface
    surface_set_target( surface );
    draw_clear_alpha( c_black, 0 );
    draw_set_alpha( 1 );
    
//  --  Render background

    if( use_background )
    {
        draw_set_color( background );
        draw_rectangle( 0,0,fullWidth,fullHeight,false );
    }
    
//  --  Render borders

    if( use_border )
    {
        draw_set_color( border_color );
        
        var i;
        for( i=0; i<border_size; i++ ) draw_rectangle( i,i,fullWidth-i-1,fullHeight-i-1,true) ;
    }
    
//  -- Render text

    // Set the font/color
    draw_set_color( text_color );
    draw_set_font( font );
    
    if( valign == fa_top )
    {
        if( halign == fa_left )
        {
            draw_text
            (
                padding_left+border_size,
                padding_top+border_size,
                text
            );
        }
        else if( halign == fa_center )
        {
            draw_text
            (
                fullWidth/2 - string_width( text )/2,
                padding_top+border_size,
                text
            );
        }
        else if( halign == fa_right )
        {
            draw_text
            (
                fullWidth-padding_right-border_size-string_width( text ),
                padding_top+border_size,
                text
            );
        }
    }
    else if( valign == fa_center )
    {
        if( halign == fa_left )
        {
            draw_text
            (
                padding_left+border_size,
                fullHeight/2 - string_height( text )/2,
                text
            );
        }
        else if( halign == fa_center )
        {
            draw_text
            (
                fullWidth/2 - string_width( text )/2,
                fullHeight/2 - string_height( text )/2,
                text
            );
        }
        else if( halign == fa_right )
        {
            draw_text
            (
                fullWidth-padding_right-border_size-string_width( text ),
                fullHeight/2 - string_height( text )/2,
                text
            );
        }
    }
    else if( valign == fa_bottom )
    {
        if( halign == fa_left )
        {
            draw_text
            (
                padding_left+border_size,
                fullHeight - padding_bottom - border_size - string_height( text ),
                text
            );
        }
        else if( halign == fa_center )
        {
            draw_text
            (
                fullWidth/2 - string_width( text )/2,
                fullHeight - padding_bottom - border_size - string_height( text ),
                text
            );
        }
        else if( halign == fa_right )
        {
            draw_text
            (
                fullWidth-padding_right-border_size-string_width( text ),
                fullHeight - padding_bottom - border_size - string_height( text ),
                text
            );
        }
        
    }
    
//  --  Create sprite from surface

    surface_reset_target();
    if( sprite_index != noone ) sprite_delete( sprite_index );
    sprite_index = sprite_create_from_surface( surface, 0,0,fullWidth,fullHeight,false,false,0,0 );
    surface_free( surface );
    
show_debug_message( "[ GMPE_Label ]: Rendered!" );
    
