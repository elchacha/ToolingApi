public class VsCodeDebugLimits {


public static boolean isVisibleDuringInjection=false;

public static void BreakPointLimit(){
    
    List<Case> cases = [select AccountId,CaseNumber,ClosedDate,ContactEmail,ContactFax,ContactId,ContactMobile,ContactPhone,CreatedById,CreatedBy.Name,CreatedDate,Id,IsClosed,IsDeleted,IsEscalated,LastModifiedById,LastModifiedBy.Name,LastModifiedDate,LastReferencedDate,LastViewedDate,MasterRecordId,Origin,OwnerId,Owner.Name,ParentId,Priority,Reason,SLAViolation__c,SourceId,Status,Subject,SuppliedCompany,SuppliedEmail,SuppliedName,SuppliedPhone,SystemModstamp,Type from Case];

    // Possible to display one record but all records won't be displayed by default
    // this system.debug is useless, just here so I can add a checkpoint
    system.debug(cases[0]);
}



// Les problèmes : vscode ne sait pas lire le dump correctement et la dev console non plus
// option : SOQL injection ou parser le dump proprement
public static void CheckPointLimit(boolean isApexInjection){
    isVisibleDuringInjection=true;
    if(isApexInjection)insert new Case();
    for(Opportunity opp :  [select AccountId,Amount,CampaignId,CloseDate,ContactId,CreatedById,CreatedBy.Name,LeadSource,Name,NextStep,OwnerId,Owner.Name,Probability,PushCount,StageName,SystemModstamp,Type from Opportunity]){
    // The Dump is containing the information but vscode is not ready the dump correctly -> rewrite the dump reader or use a "soql injection"
        if(!isApexInjection)system.debug(opp.Id);
    }
    System.debug('!!!!!!!!!!!!! If you can see me, transaction is not rollback !!!!!!!!!!!!!!!!');
}


// select SOQLResult from ApexExecutionOverlayResult where id='07n7S000000CbGGQA0'
// /services/data/v56.0/tooling/query?q=select+SOQLResult+from+ApexExecutionOverlayResult+order+by+LastModifiedDate+desc+limit+1


public static void testApexInjectionAnonymousCode(){
// the line below will not work , be careful    
    System.debug('Can I see inside apex memory transaction ?? : '+VsCodeDebugLimits.isVisibleDuringInjection);
    system.debug([select count(Id) from Case]);
    system.debug([select Department,LeadSource    from Contact limit 10]);
}

}