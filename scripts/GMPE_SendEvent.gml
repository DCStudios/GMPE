/// GMPE_SendEvent( event_name, data );
/*
    * Note: You can only use this function inside object that have previously
            called the "GMPE_EnableEvents" function.
            
    Send an event from this object with the data.
    
    Returns true if success, false if failed.
*/
//  --  Get the arguments

    var T,D;
    if( argument_count != 2 ) GMPE_Error( "GMPE_SendEvent", "Wrong number of arguments!" );
    T = argument[0];    // The event type
    D = argument[1];    // The event data
    
//  --  Validate arguments

    if( !is_string( T ) ) show_error( "GMPE_SendEvent: Event type must be a string!", true );
    if( T == "" ) return false;             // Make sure type isn't empty
    if( is_undefined( D ) ) return false;   // Make sure data is readable
    
//  --  Send the event

    // Check if anyone is listeneing to the event
    var CL; // Callback list
    var CD; // Callback data
    
    if( ds_map_exists( GMPE_Listeners, T ) )
    {
        // Get all the callbacks to call
        CL = GMPE_Listeners[? T];
        
        // Call each callback, sending the id and the data as arguments
        for( var i=0; i<ds_list_size( CL ); i++ )
        {
            CD = CL[| i];
            if( instance_exists( CD[0] ) ) with( CD[0] ) script_execute( CD[1], id, D );
        }
    }
    
return true;
