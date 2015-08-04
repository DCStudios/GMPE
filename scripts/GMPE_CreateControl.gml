/*
    Creates the necessary structures to
    use the control functions on this object.
*/

//  --  GMPE class stuff

    globalClass = "Control";
    class = "Control";

//  --  Enable Events

    GMPE_EnableEvents();
    GMPE_OnEvent( id, "addedToContainer", GMPE_Control_AddedToContainer );
    GMPE_OnEvent( id, "removedFromContainer", GMPE_Control_RemovedFromContainer );
    
//  --  Parent stuff

    parentx = 0;
    parenty = 0;
    parent = noone;
    
//  --  Dimensions

    width = 0;
    height = 0;
    
//  --  Surface stuff

    surface = -1;
    sprite_index = noone;
