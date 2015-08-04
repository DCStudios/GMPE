/*
    Free the structures used in the control.
*/

//  --  Free the events

    GMPE_OffEvent( id, "addedToContainer", GMPE_Control_AddedToContainer );
    GMPE_OffEvent( id, "removedFromContainer", GMPE_Control_RemovedFromContainer );
    GMPE_FreeEvents();
    
//  --  Free the parent

    parent = noone;
    
//  --  Free the sprite

    if( sprite_index != noone ) sprite_delete( sprite_index );
    sprite_index = noone;
