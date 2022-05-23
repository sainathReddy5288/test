Global class UpdatecontactEmailInbond implements Messaging.InboundEmailHandler
{
	Global Messaging.InboundEmailResult HandleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope env)
    {
        Messaging.InboundEmailResult result= new Messaging.InboundEmailResult();        
        List<Contact> contactRecords;    
        
        try
        {
           contactRecords = new List<Contact>();
            
           contactRecords = [Select id, firstname, lastname, email, email_subject__C, email_content__C
                           				from Contact
                           					Where email =: email.fromAddress
                           							Limit 1]; 
        }
        Catch(System.Exception ex)
        {
            system.debug('Exception has been occured upon fetching the Record.');
            system.debug('Exception Message is....: '+ ex.getMessage());
            system.debug('Exception Line Number is....: '+ ex.getLineNumber());
            system.debug('Exception Root Cause is...: '+ ex.getCause());
            system.debug('Stack Trace String is....: '+ ex.getStackTraceString());
        }
        
        // Check for the Contact Record Existance..
        if(! contactRecords.isEmpty() ) 
        {
            // Matching Contact Record Found..            
            	contactRecords[0].Email_Subject__c = email.subject;
            	contactRecords[0].Email_Content__c = email.plainTextBody;             
        }
        else 
        {
            // Matching Contact Not Found.. 
            Contact contactRecord = new Contact();           
            	contactRecord.LastName = email.fromName;
            	contactRecord.Email = email.fromAddress;
            	contactRecord.Email_Subject__c = email.subject;
            	contactRecord.Email_Content__c = email.plainTextBody;
            
              contactRecords.Add(contactRecord);
        }
        
        upsert contactRecords;
		
		// Check for the Attachments and add it to Contact Record..
		
        List<Attachment> lstAttachments = new List<Attachment>();
		
        // Check for the Text Attachments..
        if(email.textAttachments != null)
        {
            for(Messaging.InboundEmail.textAttachment txtAttachment : email.textAttachments)
            {
        		Attachment  attach = new Attachment();
                
                attach.body = Blob.valueOf(txtAttachment.body);
                attach.Name = txtAttachment.FileName;
                attach.ParentId = contactRecords[0].Id;
                
                lstAttachments.Add(attach);				                
            }
        }
        
        // Check for the Binary Attachments..
        if(email.binaryAttachments != null) 
        {
            for(Messaging.InboundEmail.BinaryAttachment bnrAttachment : email.binaryAttachments)
            {
               	Attachment  attach = new Attachment(); 
                
                attach.body = bnrAttachment.body;
                attach.Name = bnrAttachment.fileName;
                attach.ParentId = contactRecords[0].Id;
                
                lstAttachments.Add(attach);	
            }
        }
        
        // Insert the Attachments..
        if(! lstAttachments.isEmpty())
        {
            insert lstAttachments;
        }
        
        // Send the Result of Email Processing..
        result.success = true;
        return result;
    }
}