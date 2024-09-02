public with sharing class ToolingApiUtil {
    public static void createObject(String type,Map<String,Object> param){
        crud(type,param,null,'POST');
    }

    public static void updateObject(String type,Map<String,Object> param,String idObject){
        crud(type,param,idObject,'PATCH');
    }

    public static void deleteObject(String type,String idObject){
        crud(type,null,idObject,'DELETE');
    }

    public static void crud(String type,Map<String,Object> param,String idObject,String operation){
        String endOperation='/';
        if(idObject!=null){
            endOperation+=idObject;
            if(operation=='PATCH'){endOperation+=+'?_HttpMethod=PATCH';operation='POST';}
        }
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getOrgDomainUrl().toExternalForm()+'/services/data/v47.0/tooling/sobjects/'+type+endOperation);
        req.setBody(JSON.serialize(param));
        req.setMethod(operation);

        HttpResponse res =new Http().send(req);
        if(res.getStatusCode()>205){
            throw new ToolingApiException('issue encountered : '+res.getBody());
        }
    }

    public static List<Map<String, Object>> execSoql(String query){
        return execSoql(query,false);
    }

    public static List<Map<String, Object>> execSoql(String query,boolean keepAttributes){
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getOrgDomainUrl().toExternalForm()+'/services/data/v47.0/tooling/query/?q='+EncodingUtil.urlEncode(query, 'UTF-8'));
        req.setMethod('GET');
        HttpResponse res = (new Http()).send(req);
		Map<String, Object> fieldMap = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
        List<Object> recordsMap =   (List<Object>)fieldMap.get('records');
        List<Map<String, Object>> result = new List<Map<String, Object>> ();
        // in case we would like to retrieve parent information, we would need to do recursive code to process all values of the map and for each object instanceOf Map,
        // we should redo the same operation
        for(Object anObj : recordsMap){
            Map<String, Object>objMap = (Map<String, Object>) anObj;
            if(!keepAttributes)objMap.remove('attributes');
            result.add(objMap);
        }        
        return result;
    }  

    public class ToolingApiException extends Exception{
    }


}
