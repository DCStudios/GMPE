/// GMPE_SetLabelText( label_id, text );
/*
    Change the text of a label.
    All recalculation will be done if you use this function instead
    of changing the text directly.
*/

//  --  Get the arguments

    if( argument_count < 1 ) GMPE_Error( "GMPE_SetLabelText", "Wrong number of arguments!" );
    
    var L,T;
    if( argument_count == 1 ) L = id; else L = argument[0];             // Label id
    if( argument_count == 1 ) T = argument[0]; else T = argument[1];    // Text

//  --  Validate the label exists

    if( !instance_exists( L ) ) GMPE_Error( "GMPE_SetLabelText", "The label doesn't exists!" );
    if( L.class != "Label" ) GMPE_Error( "GMPE_SetLabelText", "The object you provided isn't a label!" );
    
//  --  Set the font

    L.text = T;
    
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
