/*
    Initialize the label control
*/

//  --  Inherit of GMPE_Control

    GMPE_CreateControl();
    
//  --  GMPE class stuff

    class = "Label";
    
//  --  Set some events

    GMPE_OnEvent( id, "requestRender", GMPE_Label_RequestRender );
    
//  --  Text stuff

    text = "Label";
    font = noone;
    text_align = fa_left;
    
//  --  Dimensions

    draw_set_font( font );
    width = string_width( text );
    height = string_height( text );
    
//  --  Colors

    text_color = c_black;
    background = c_white;
    border_color = c_black;
    border_size = 1;
    
    use_background = false;
    use_border = false;
    
//  --  Alignement

    halign = fa_left;
    valign = fa_top;
    
    padding_top = 0;
    padding_left = 0;
    padding_right = 0;
    padding_bottom = 0;
    
//  --  Set some flags

    shouldRender = false;
    
//  --  When initialization is completed, request a render
    
    GMPE_SendEvent( "requestRender", 0 );
