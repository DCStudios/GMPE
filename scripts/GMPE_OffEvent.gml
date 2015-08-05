/// GMPE_OffEvent( fromID, event_name, callback );
/*
    Stop listening to an event from an object.
*/

// -- Get the parameters

    var F,E,C;
    F = argument[0]; // From who should we listen for the event
    E = argument[1]; // The name of the event to listen for
    C = argument[2]; // The script to execute when the event occures
    
// -- Make sure parameters are alright

    if( !instance_exists( F ) ) exit;
    else if( !is_string( E ) ) { evt_error( "OffEvent(): The name of the event must be a string!" ); exit; }
    else if( !script_exists( C ) ) exit;
    
// -- Remove the event from the object

    var i;          // Used in loops
    var L;          // List of all callbacks for an event
    var D;          // A callback object
    
    if( ds_map_exists( F.evtListeners, E ) ) {
        L = F.evtListeners[? E];
        
        for( i=0; i<ds_list_size( L ); i++ ) {
            D = L[| i];
            if( D[0] == id && D[1] == C ) {
                ds_list_delete( L,i );
                break;
            }
        }
        
        F.evtListeners[? E] = L;
    }
