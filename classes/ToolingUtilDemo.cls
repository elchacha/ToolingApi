public with sharing class ToolingUtilDemo {

    public static void createCustomLabel(String masterLabel,String name,String value){
        Map<String,Object> externalString = new Map<String,Object>();
        externalString.put('MasterLabel',masterLabel);
        externalString.put('Name',name);
        externalString.put('Value',value);
        ToolingApiUtil.createObject('ExternalString',externalString);
    }


    public static void updateCustomLabelValue(String newValue,String apiName){
        Map<String,Object> externalStringUpdate = new Map<String,Object>();
        externalStringUpdate.put('Value',newValue); 
        String idCustomLabel = (String)ToolingApiUtil.execSoql('select Id from ExternalString where Name=\''+apiName+'\'')[0].get('Id');
        ToolingApiUtil.updateObject('ExternalString',externalStringUpdate,idCustomLabel);
    }


    public static void deleteCustomLabelValue(String apiName){
        String idCustomLabel = (String)ToolingApiUtil.execSoql('select Id from ExternalString where Name=\''+apiName+'\'')[0].get('Id');
        ToolingApiUtil.deleteObject('ExternalString',idCustomLabel);
    }
}