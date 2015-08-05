/*
    =========================================================================================================================
        
        Game Maker Presentation Extension - An UI extension for Game Maker : Studio
        
        ----------------------------------   
                                                        // // //      //          //       // // //         // // // //
            - Author:   Cédrik Dubois               //               // //    // //       //       //      //
            - Version:  Alpha v0.1                 //    // //      //    //    //       // // //         // // //
            - Price:    0.00$                     //       //      //          //       //               //
                                                    // // //      //          //       //               // // // //
        ----------------------------------
       Winky edited this line instead!
    =======================================================================================================================
    
    -- NOTE ---------------------------------
    
        Use the search option to quickly
        jump to a secion using the table
        names below.
        
    -----------------------------------------
    
    
    ------------------------------------------------------------------------------------------------------------------------
        TABLE OF TOPICS
    ------------------------------------------------------------------------------------------------------------------------
    
        * Events
    
    ------------------------------------------------------------------------------------------------------------------------
    
    
    
    
    
    
    
    ------------------------------------------------------------------------------------------------------------------------
        * Events
    ------------------------------------------------------------------------------------------------------------------------
    
    |   -- DESCRIPTION -----------------------------------------------------------------------------------------------
        
            An event is a signal that an object will produce, and which other object can wait for and react to it
            when it occures.
            
            An easy example of how an event works looks like this:
            
                Imagine some one comes at your door, and presses the doorbell. DING DONG!
                When you hear the sound, you know that someone is at the door.
                You can go and open the door, you can check in the window who it is and decide
                not to open the door, you can even just ignore it.
                
                -   The person who presses the doorbell is a 'signal sender'. He is the one to press on the
                    doorbell.
                    
                -   The doorbell is the event. You can listen to it, or you can ignore it. It is the 'signal'.
                
                -   You, the one who decides what to do, are the listener. When the 'signal', or the 'event' occures,
                    you have the choice to do something about it.
                    
            Using events, you can 'wait' until 'something' happens, and then react to it.
            It can be pretty usefull in many cases.
            
    |   -- FUNCTIONS ----------------------------------------------------------------------------------------------------
        
            GMPE_EnableEvents():
            
                If you want an object to send some events ( to be able to press the doorbell ) then you need
                to call this function first. It will setup all the needed structures behind the scene for you.
            
            
                        
            GMPE_SendEvent( event_name, data ):
            
                * NOTE: You have to call GMPE_EnableEvents() before calling this function!    
            
                This the the function to 'press the doorbell'. It will tell everyone listening to the event that
                the event occured. The < event_name > is a string, and the < data > is whatever you want.
                Data will be sended as the second parameter to the callback.
            
                
                    
            GMPE_OnEvent( id, event_name, callback ):
            
                If you want to react to an event, you have to listen to it.
                This function will listen to the event < event_name > from the object < id >.
                When the event occures, the script < callback > will be called.
                The script must have 2 parameters:
                   argument[0]:  The sender of the event. It is the id of the object who created the event.
                   argument[1]:  The data of the event. ( Can be anything, make sure you organize your stuff )
            
            
                                 
            GMPE_OffEvent( id, event_name, callback ):
            
                If you want to stop listening to an event, use this function.
                You must specify the object's id, the event's name and the callback that you want
                to stop using.
                
                
                
            GMPE_FreeEvents()
            
                This will free all the memory used by the events in the calling object.
                Use this to free all the structures used behind the scene.

*/
