/// FreeEvents();
/*
    Free any used memory
*/

//  --  First, destroy all the list inside the map

    var key;
    key = ds_map_find_first( Listeners );
    while( !is_undefined( key ) )
    {
        ds_list_destroy( key );
        key = ds_map_find_next( Listeners, key );
    }
    
//  --  Next, destroy the map

    ds_map_destroy( Listeners );
