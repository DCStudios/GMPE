/// GMPE_SetLabelPadding( label_id, left, right, top, bottom );
/*
    Change the padding of a label.
    All recalculation will be done if you use this function instead
    of changing the padding directly.
*/

//  --  Get the arguments

    if( argument_count < 4 ) GMPE_Error( "GMPE_SetLabelPadding", "Wrong number of arguments!" );
    
    var L,PL,PR,PT,PB;
    if( argument_count == 4 ) L = id; else L = argument[0];               // Label id
    if( argument_count == 4 ) PL = argument[0]; else PL = argument[1];    // Left padding
    if( argument_count == 4 ) PR = argument[1]; else PR = argument[2];    // Right padding
    if( argument_count == 4 ) PT = argument[2]; else PT = argument[3];    // Top padding
    if( argument_count == 4 ) PB = argument[3]; else PB = argument[4];    // Bottom padding

//  --  Validate the label exists

    if( !instance_exists( L ) ) GMPE_Error( "GMPE_SetLabelPadding", "The label doesn't exists!" );
    
//  --  Set the color

    L.padding_left = PL;
    L.padding_right = PR;
    L.padding_top = PT;
    L.padding_bottom = PB;
    
//  --  Mark the label as being dirty for render

    L.shouldRender = true;
