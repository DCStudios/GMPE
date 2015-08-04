/// GMPE_Error( script, description )
/**
    @syntax GMPE_Error( script, description )
	@author Cedrik Dubois
	@param   script        			 The name of the script in which the error occured.
	@param   [string]  description   Description of the error
	@desc                            This function is an alternative to 'show_error'.
									 It will format the error so its easier to read.
	@returns
*/

var content = "";

if( argument[0] != "" ) content += "in script "+argument[0]+":"+chr(13)+chr(10)+chr(13)+chr(10)+argument[1];

show_error
(
    "-----------------------------------------------------------------------------------------------------"+chr(13)+chr(10)+
    "                                   GMPE encountered an error!"+chr(13)+chr(10)+
    "-----------------------------------------------------------------------------------------------------"+chr(13)+chr(10)+
    chr(13)+chr(10)+
    content+
    chr(13)+chr(10)+chr(13)+chr(10)+
    "-----------------------------------------------------------------------------------------------------"+chr(13)+chr(10)
    ,
    true
);