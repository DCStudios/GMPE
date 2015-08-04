/// GMPE_Rect( x, y, width, height );
/*
    Returns a structur representing a rectangle.
    - rect[0] = x
    - rect[1] = y
    - rect[2] = width
    - rect[3] = height
*/
//  --  Get arguments

    var X,Y,W,H;
    if( argument_count != 4 ) show_error( "GMPE_Rect: Wrong number of arguments!", true );
    X = argument[0];
    Y = argument[1];
    W = argument[2];
    H = argument[3];
    
//  --  Validate arguments

    if( W < 0 ) show_error( "GMPE_Rect: A rectangle cannot have a negative width!", true );
    if( H < 0 ) show_error( "GMPE_Rect: A rectangle cannot have a negative height!", true );
    
//  --  Create the rectangle

    var R;
    R[0] = X;
    R[1] = Y;
    R[2] = W;
    R[3] = H;
    
return R;