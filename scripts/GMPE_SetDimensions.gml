/// GMPE_SetDimensions( container, x, y, width, height );
/*
    Change the position and size of a container.
    This will trigger all the calculation needed to position
    and resize all the childs within the container.
*/

//  --  Validate arguments

    if( argument_count != 5 ) GMPE_Error( "GMPE_SetDimensions", "Wrong number of arguments!" );
    if( !instance_exists( argument[0] ) ) GMPE_Error( "GMPE_SetDimensions", "The container doesn't exists!" );
    if( argument[3] < 0 || argument[4] < 0 ) GMPE_Error( "GMPE_SetDimensions",  "The container's size cannot be negative!" );

//  --  Get the arguments

    var C,X,Y,W,H;
    C = argument[0];    // Container's ID
    X = argument[1];    // x position
    Y = argument[2];    // y posiiton
    W = argument[3];    // width of container
    H = argument[4];    // height of container
        
//  --  Set the size

    with( C )
    {
        x = X;
        y = Y;
        real_width = W;
        real_heiht = H;
        width = W-lpadding-rpadding;
        height = H-tpadding-bpadding;
        
        GMPE_SendEvent( "resized", 0 );
    }
