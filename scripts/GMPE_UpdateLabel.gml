/*
    Checks if label should re-render
*/
if( shouldRender )
{
    shouldRender = false;
    GMPE_SendEvent( "requestRender", 0 );
}
