/// GMPE_RemoveChild( container, control );

//  --  Validate arguments

    if( argument_count < 2 ) GMPE_Error( "GMPE_RemoveChild", "Wrong number of arguments!" );
    if( !instance_exists( argument[0] ) ) GMPE_Error( "GMPE_AddChild", "Container doesn't exists!" );
    if( !instance_exists( argument[1] ) ) GMPE_Error( "GMPE_AddChild", "Control doesn't exists!" );
    
//  --  Get arguments

    var P,C;
    P = argument[0];
    C = argument[1];
    
//  --  Remove child from parent

    if( C.parent != P ) GMPE_Error( "GMPE_RemoveChild", "Control is not a child of Container!" );
    else
    {
        ds_list_delete( P.childs, ds_list_find_index( P.childs, C ) );
        C.parent = noone;
        C.parentx = 0;
        C.parenty = 0;
        with( C ) GMPE_SendEvent( "removedFromContainer", 0 );
    }
