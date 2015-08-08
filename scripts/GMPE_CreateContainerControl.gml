/*
    Creates the necessary structures to
    use the container and control functions
    on this object.
*/

//  --  GMPE class stuff

    globalClass = "ContainerControl";
    class = "ContainerControl";

//  --  Enable Events

    GMPE_EnableEvents();
    GMPE_OnEvent( id, "addedToContainer", GMPE_Control_AddedToContainer );
    GMPE_OnEvent( id, "removedFromContainer", GMPE_Control_RemovedFromContainer );

//  --  Childs

    childs = ds_list_create();
    child_limit = 0;
        
//  --  Parent stuff

    parentx = 0;
    parenty = 0;
    parent = noone;
    
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
