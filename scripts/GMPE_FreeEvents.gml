/// GMPE_FreeEvents();
/*
    Removes all listeners and free's memory.
*/
    
// -- Remove the event from the object

    var i; // Used in loops
    var L; // List of all callbacks for an event
    var D; // A callback object
    var E; // The event's name
    
    E = ds_map_find_first( evtListeners );
    while( !is_undefined( evtListeners[? E] ) ) {
        L = evtListeners[? E];
        ds_list_clear( L );
        ds_list_destroy( L );
        
        var oldKey = E;
        E = ds_map_find_next( evtListeners, E );
        ds_map_delete( evtListeners, oldKey );
    }
    
    ds_map_clear( evtListeners );
    ds_map_destroy( evtListeners );
