/*
    Checks if button should re-render,
    and check for mouse stuff
*/
var dx=0,dy=0,lastState=state;
if( parent != noone ) {
    dx = x-parentx;
    dy = y-parenty;
}

if( state != stateDisabled ) {
    if( collision_point( mouse_x-dx,mouse_y-dy,id,true,false ) ) {
        if( mouse_check_button( mb_left ) ) state = stateActive;
        else state = stateHover;
    }
    else state = stateNormal;
}

if( state != lastState ) shouldRender = true;

if( shouldRender )
{
    shouldRender = false;
    GMPE_SendEvent( "requestRender", 0 );
}
