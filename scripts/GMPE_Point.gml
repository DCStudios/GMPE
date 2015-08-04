/// GMPE_Point( x, y );
/*
    Returns a structur representing a point.
    - point[0] = x
    - point[1] = y
*/
//  --  Get arguments

    var X,Y;
    if( argument_count != 2 ) show_error( "GMPE_Point: Wrong number of arguments!", true );
    X = argument[0];
    Y = argument[1];
    
//  --  Create the point

    var P;
    P[0] = X;
    P[1] = Y;
    
return P;