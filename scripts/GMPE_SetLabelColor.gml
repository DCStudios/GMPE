/// GMPE_SetLabelColor( label_id, back_color, border_color, text_color );
/*
    Change the color of a label.
    If a color for the background or the border is set to noone,
    the said property's visibility will be set to false.
    All recalculation will be done if you use this function instead
    of changing the color directly.
*/

//  --  Get the arguments

    if( argument_count < 3 ) GMPE_Error( "GMPE_SetLabelColor", "Wrong number of arguments!" );
    
    var L,BCKC,BORC,TXTC;
    if( argument_count == 3 ) L = id; else L = argument[0];                   // Label id
    if( argument_count == 3 ) BCKC = argument[0]; else BCKC = argument[1];    // Background Color
    if( argument_count == 3 ) BORC = argument[1]; else BORC = argument[2];    // Border Color
    if( argument_count == 3 ) TXTC = argument[2]; else TXTC = argument[3];    // Text Color

//  --  Validate the label exists

    if( !instance_exists( L ) ) GMPE_Error( "GMPE_SetLabelColor", "The label doesn't exists!" );
    
//  --  Set the color

    if( BCKC != noone )
    {
        L.use_background = true;
        L.back_color = BCKC;
    }
    else L.use_background = false;
    
    if( BORC != noone )
    {
        L.use_border = true;
        L.border_color = BORC;
    }
    else L.use_border = false;
    
    if( TXTC != noone ) L.text_color = TXTC;
    
//  --  Mark the label as being dirty for render

    L.shouldRender = true;
