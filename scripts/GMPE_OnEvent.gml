/// GMPE_OnEvent( fromID, event_name, callback );
/*
    Execute a script ( <callback> ) when the <event_name> is thrown
    from the <fromID> object.
    
    
    - NOTE -
    
        If you try to listen to an event that this object already listens to,
        nothing will happen.
*/

// -- Get the parameters

    var F,E,C;
    F = argument[0]; // From who should we listen for the event
    E = argument[1]; // The name of the event to listen for
    C = argument[2]; // The script to execute when the event occures
    
// -- Make sure parameters are alright

    if( !instance_exists( F ) ) { evt_error( "OnEvent(): Trying to listen to an instance that doesn't exists!" ); exit; }
    else if( !is_string( E ) ) { evt_error( "OnEvent(): The name of the event must be a string!" ); exit; }
    else if( !script_exists( C ) ) { evt_error( "OnEvent(): The callback doesn't exists!" ); exit; }
    
// -- Add the event to the object

    var i;          // Used in loops
    var A = false;  // 'A' stands for 'abort'
    var L;          // List of all callbacks for an event
    var D;          // A callback object
    
    if( ds_map_exists( F.evtListeners, E ) ) {
        L = F.evtListeners[? E];
        for( i=0; i<ds_list_size( L ); i++ ) {
            D = L[| i];
            if( D[0] == id && D[1] == C ) {
                A = true;
                break;
            }
        }
        
        if( !A ) {
            D=0; // Unassign array
            D[0] = id;
            D[1] = C;
            ds_list_add( L,D );
        }
        
        F.evtListeners[? E] = L;
    }
    else {
        L = ds_list_create();
        D[0] = id;
        D[1] = C;
        ds_list_add( L,D );
        F.evtListeners[? E] = L;
    }
