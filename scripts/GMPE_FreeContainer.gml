/*
    Call this inside a container.
    It will free the necessary structures used by the container.
*/

//  --  Free the events

    GMPE_FreeEvents();
    
//  --  Free the childs

    ds_list_destroy( childs );
    
//  --  Free sprite

    if( sprite_index != noone ) sprite_delete( sprite_index );
    sprite_index = noone;
