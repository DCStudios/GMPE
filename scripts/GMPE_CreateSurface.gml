/// GMPE_CreateSurface()
/*
    Create the structures for the surface.
*/

//  --  Inherit of Containers

    GMPE_CreateContainer();
    
//  --  GMPE class stuff

    class = "Surface";

//  --  Childs

    child_limit = 1;
        
//  --  Dimensions

    width = room_width;
    height = room_height;
    real_width = width;
    real_height = height;
