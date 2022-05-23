@restresource(URLMapping='/contactservice/*')
Global class contactrecordservice 
{
    @httpDelete()
    Global static string DeleteContactRecordsById()
    {
        map<string,string> mapinputparams=restcontext.request.params;
        
        Delete[select id,firstname,lastname from contact where id=:mapinputparams.get('id')];
        
        return 'records Delete';
    }

}