/*
    Initialize the button control
*/

//  --  Inherit of GMPE_ContainerControl

    GMPE_CreateContainerControl();
    
//  --  GMPE class stuff

    globalClass = "ContainerControl";
    class = "Button";
    
//  --  Set some events

    GMPE_OnEvent( id, "requestRender", GMPE_Button_RequestRender );
    


