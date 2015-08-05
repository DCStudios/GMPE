/// GMPE_EnableEvents()
/*
    Creates the needed data structures to be able to let other
    objects listen to the event this object will send.
*/

evtListeners = ds_map_create();
