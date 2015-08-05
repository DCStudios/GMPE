/// GMPE_SendEvent( event_name, data );
/*
    Send an event to all listeners of that event.
*/

// -- Get the parameters

    var E,D;
    E = argument[0]; // The event to send
    D = argument[1]; // The data to send with the event
    
// -- Make sure parameters are alright

    if( !is_string( E ) ) { evt_error( "SendEvent(): The name of the event must be a string!" ); exit; }
    
// -- Remove the event from the object

    var i;          // Used in loops
    var L;          // List of all callbacks for an event
    var C;          // A callback object
    
    if( ds_map_exists( evtListeners, E ) ) {
        L = evtListeners[? E];
        
        for( i=0; i<ds_list_size( L ); i++ ) {
            C = L[| i];
            if( instance_exists( C[0] ) ) {
                if( script_exists( C[1] ) ) with( C[0] ) script_execute( C[1], other.id, D );
            }
        }
    }
