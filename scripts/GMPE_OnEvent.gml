/// GMPE_OnEvent( id, event_name, callback )
/*
    When the event <type> occures from <object>,
    the scripts <callback> will be executed.
    
    Don't forget to call "GMPE_OffEvent" to remove the
    callback from the listeners.
    
    Returns true on success, false if failed.
*/
//  --  Get the arguments

    var O,T,C;
    if( argument_count != 3 ) show_error( "GMPE_OnEvent: Wrong number of arguments!", true );
    O = argument[0];    // Object to listen
    T = argument[1];    // Event type to listen
    C = argument[2];    // Callback to call when even occurs
    
//  --  Validate the arguments

    if( !instance_exists( O ) ) return false;               // Make sure object exists
    if( is_undefined( O.GMPE_Listeners ) ) return false;    // Make sure object can send events
    if( !is_string( T ) ) show_error( "GMPE_OnEvent: Event type must be a string!", true );
    if( T == "" ) return false;                             // Make sure event type isn't empty
    if( !script_exists( C ) ) return false;                 // Make sure callback exists
    
//  --  Add listener


    var CL; // List of callbacks
    var CD; // Callback data
    
    // Try to get the list of callback, else create a new one
    if( ds_map_exists( O.GMPE_Listeners, T ) ) CL = O.GMPE_Listeners[? T];
    else CL = ds_list_create();
    
    // Check if callback is not already present
    for( var i=0; i<ds_list_size( CL ); i++ )
    {
        CD = CL[| i];
        if( CD[0] == id && CD[1] == C ) return false;
    }
    
    // Add the callback to thelist
    CD[0] = id;
    CD[1] = C;
    ds_list_add( CL, CD );
    
    // Add the new list of callback in the listeners list
    O.GMPE_Listeners[? T] = CL;
    
return true;
