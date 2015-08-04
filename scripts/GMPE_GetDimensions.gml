/// GMPE_GetDimensions( container );
/*
    This function returns the size of the area where a control
    is allowed to draw itself.
    
    Returns: A 'Rect' array.
*/

//  --  Validate arguments

    if( argument_count != 1 ) GMPE_Error( "GMPE_GetDimensions", "Wrong number of arguments!" );
    if( !instance_exists( argument[0] ) ) GMPE_Error( "GMPE_GetDimensions", "The container doesn't exists!" );
    
//  --  Get the arguments

    var C;
    C = argument[0];    // Container ID
    
//  --  Create and get the container's dimensions

    var D;
    D = GMPE_Rect( C.x+C.lpadding, C.y+C.tpadding, C.width, C.height );
    
return D;
