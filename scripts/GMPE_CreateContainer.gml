/*
    Call this inside a container.
    It will create the necessary structures to use the GMPE Container functions.
*/

//  --  GMPE class stuff

    globalClass = "Container";
    class = "Container";

//  --  Enable events

    GMPE_EnableEvents();
    
//  --  Childs

    childs = ds_list_create();
    child_limit = 0;
    
//  --  Dimensions

    lpadding = 0;
    rpadding = 0;
    tpadding = 0;
    bpadding = 0;
    width = 0;
    height = 0;
    real_width = 0;
    real_height = 0;
    
//  --  Surface stuff

    surface = -1;
    sprite_index = noone;
