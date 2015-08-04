/// GMPE_AddChild( container, control );

//  --  Validate arguments

    if( argument_count < 2 ) GMPE_Error( "GMPE_AddChild", "Wrong number of arguments!" );
    if( !instance_exists( argument[0] ) ) GMPE_Error( "GMPE_AddChild", "Container doesn't exists!" );
    if( !instance_exists( argument[1] ) ) GMPE_Error( "GMPE_AddChild", "Control doesn't exists!" );
    
//  --  Get arguments

    var P,C;
    P = argument[0];
    C = argument[1];
    
//  --  Add to childs of parent

    if( ds_list_size( P.childs ) < P.child_limit || P.child_limit == 0 )
    {
        if( C.parent != noone ) GMPE_Error( "GMPE_AddChild:", "Control is already a child of a container!" );
        else
        {
            C.parent = P;
            ds_list_add( P.childs, C );
            with( C ) GMPE_SendEvent( "addedToContainer", P );
        }
    }
    else GMPE_Error( "GMPE_AddChild", "Container has already reached childs limit!" ); 