/// OffEvent( object, type, callback )
/*
    Remove a previously OnEvent.
    
    Returns true on success, false if failed.
*/
//  --  Get the arguments

    var O,T,C;
    if( argument_count != 3 ) show_error( "OffEvent: Wrong number of arguments!", true );
    O = argument[0];    // Object that was listened
    T = argument[1];    // Event type that was listened
    C = argument[2];    // Callback that was called
    
//  --  Validate the arguments

    if( !instance_exists( O ) ) return false;               // Make sure object exists
    if( is_undefined( O.Listeners ) ) return false;    // Make sure object can send events
    if( !is_string( T ) ) show_error( "OffEvent: Event type must be a string!", true );
    if( T == "" ) return false;                             // Make sure event type isn't empty
    if( !script_exists( C ) ) return false;                 // Make sure callback exists
    
//  --  Remove listener

    var CL; // List of callbacks
    var CD; // Callback Data
    
    // Check if event was listened to
    if( ds_map_exists( O.Listeners, T ) )
    {
        // Get the list of callbacks
        CL = O.Listeners[? T];
        for( var i=0; i<ds_list_size( CL ); i++ )
        {
            // Delete the callback matching the argument
            CD = CL[| i];
            if( CD[0] == id && CD[1] == C )
            {
                ds_list_delete( CL, i );
                break;
            }
        }
        
        // If there are no more callbacks, destroy the list
        if( ds_list_size( CL ) == 0 )
        {
            ds_list_destroy( CL );
            ds_list_destroy( O.Listeners[? T] );
            ds_map_delete( O.Listeners, T );
        }
        // Otherwise update the listener list of the event
        else O.GMPE_Listeners[? T] = CL;
    }
    else return false;
    
return true;

