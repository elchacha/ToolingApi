# ToolingApi

to test the apex part : 

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

// creation of a customLabel with the toolingApi
ToolingUtilDemo.createCustomLabel('test2','test2','test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

// updating a customLabel with the toolingApi
ToolingUtilDemo.updateCustomLabelValue('test3','test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

// deleting a customLabel with the toolingApi
ToolingUtilDemo.deleteCustomLabelValue('test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));
