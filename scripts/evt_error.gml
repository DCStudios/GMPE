/// evt_error( message )
/*
    Simply diplay error in a message box.
    This doesn't affect your game and simply warns you
    when something went wrong.
*/
show_message_async( "[ EVENT - ERROR ]:##"+argument[0] );
show_debug_message( "[ EVENT - ERROR ]: "+argument[0] );
