public class casemanagercontroller {
     Public string accesstokenstring{get;set;}
    
    public string getaccesstoken()
    {
        string accessTokenValue = '';
        string authorizationservrendpoint = 'https://login.salesforce.com/services/oauth2/token';
        string clientID = '3MVG9G9pzCUSkzZsqXpqyJl4lDtQd9WsMCQOSoeRec4Wlj4YHtOvPV_RaZ9Boahp0iSaxICx6po7eBo3klRua';
        string clientsecret = 'ECFCE5264CAB8B00CA9B0418A997DF8DB3F8A851365557B0370AFDF8A3DBFA95';
        string username = 'lakshman.saleforce@abc.com';
        string password = 'lakshman00';
        
        string requestBod = 'grant_type=password&client_id='+clientID+'&client_secret='+clientsecret+'&username='+username+'&password='+password;
        
        Http aHttp = new Http();
        
        HttpRequest aRequest = new HttpRequest();
        aRequest.setEndpoint(authorizationservrendpoint);
        aRequest.setBody(requestBod);
        aRequest.setMethod('Post');
        
        HttpResponse aResponse = new HttpResponse();
        aResponse =	aHttp.send(aRequest);
        
        system.JSONParser aParser = system.JSON.createParser(aResponse.getBody());
        
        while(aParser.nextToken() !=null)
        {
            if(aParser.getCurrentToken() == system.JSONToken.FIELD_NAME && aParser.getText() == 'access_token')
            {
                aParser.nextToken();
                accessTokenValue = aParser.getText();
            }
        }
        
        return accessTokenValue;
        
        }
    public void getcaserecord()
    {
        string accessToken = getaccesstoken();
        string accesstokenstring = accessToken;
    }

}