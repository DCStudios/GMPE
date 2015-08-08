/// GMPE_FreeButton()
/*
    Free the memory used by the button's structures.
*/

//  --  Free the sprites

    if( stateNormal != noone ) if( string_copy( sprite_get_name( stateNormal ),1,11 ) == "__newsprite" ) sprite_delete( stateNormal );
    if( stateHover != noone ) if( string_copy( sprite_get_name( stateHover ),1,11 ) == "__newsprite" ) sprite_delete( stateHover );
    if( stateActive != noone ) if( string_copy( sprite_get_name( stateActive ),1,11 ) == "__newsprite" ) sprite_delete( stateActive );
    if( stateDisabled != noone ) if( string_copy( sprite_get_name( stateDisabled ),1,11 ) == "__newsprite" ) sprite_delete( stateDisabled );
    if( sprite_index != noone ) if( string_copy( sprite_get_name( sprite_index ),1,11 ) == "__newsprite" ) sprite_delete( sprite_index );

//  --  Free some events

    GMPE_OffEvent( id, "requestRender", GMPE_Button_RequestRender );

//  --  Free the control

    GMPE_FreeControl();
