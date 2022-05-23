@restresource(urlmapping='/chandusai/*')
global class positionhelper 
{
    @httpget()
global static list<position__c> getpositions()
{
    
    map<string,string> mapsetlocation = RestContext.request.params;
    list<position__c> lstposition =[select id,position_status__c,location__c,Annualrevenue__c from position__c where 
                                    location__c =: mapsetlocation.get('location__c')];
    return lstposition;

}
}