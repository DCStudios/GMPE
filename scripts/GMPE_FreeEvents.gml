/// GMPE_FreeEvents();
/*
    Free any used memory
*/

//  --  First, destroy all the list inside the map

    var GMPE_Key;
    GMPE_Key = ds_map_find_first( GMPE_Listeners );
    while( !is_undefined( GMPE_Key ) )
    {
        ds_list_destroy( GMPE_Key );
        GMPE_Key = ds_map_find_next( GMPE_Listeners, GMPE_Key );
    }
    
//  --  Next, destroy the map

    ds_map_destroy( GMPE_Listeners );
