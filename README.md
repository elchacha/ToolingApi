# ToolingApi

to test the apex part : 

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

ToolingUtilDemo.createCustomLabel('test2','test2','test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

ToolingUtilDemo.updateCustomLabelValue('test3','test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));

ToolingUtilDemo.deleteCustomLabelValue('test2');

System.debug(ToolingApiUtil.execSoql('select Id,Value,Name from ExternalString',false));
