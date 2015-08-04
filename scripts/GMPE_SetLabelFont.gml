/// GMPE_SetLabelFont( label_id, font );
/*
    Change the font of a label.
    All recalculation will be done if you use this function instead
    of changing the font directly.
*/

//  --  Get the arguments

    if( argument_count < 1 ) GMPE_Error( "GMPE_SetLabelFont", "Wrong number of arguments!" );
    
    var L,F;
    if( argument_count == 1 ) L = id; else L = argument[0];             // Label id
    if( argument_count == 1 ) F = argument[0]; else F = argument[1];    // Font

//  --  Validate the label exists

    if( !instance_exists( L ) ) GMPE_Error( "GMPE_SetLabelFont", "The label doesn't exists!" );
    
//  --  Set the font

    L.font = F;
    
//  --  Do all the calculation

    with( L )
    {
        draw_set_font( font );
        
        width = string_width( text );
        height = string_height( text );
        
        if( parent != noone )
        {
            var D = GMPE_GetDimensions( parent );
            width = min( width, D[2] );
            height = min( height, D[3] );
        }
    }
    
//  --  Mark the label as being dirty for render

    L.shouldRender = true;
