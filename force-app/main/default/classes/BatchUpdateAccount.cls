Global class BatchUpdateAccount Implements Database.batchable<sObject>{
    
Global Database.QueryLocator Start(Database.BatchableContext bContext)
    {
        String accountsQuery = 'Select id, name, rating, industry, annualrevenue, type, ownership, active__c from Account';        
        return Database.getQueryLocator(accountsQuery);
    }    
    
Global void Execute (Database.BatchableContext bContext, List<SObject> lstRecords){
  	  
     		   if(! lstRecords.isEmpty())
      			  {
         		   List<Account> accountsToUpdate = new List<Account>();
            	 for (SObject obj: lstRecords)
            		{
                // Convert the SObject Type into Account Type
                Account accRecord = (Account) obj;                
                // Assign the New Values for the Record
                	//accRecord.Active__c = 'Yes';
                	accRecord.Ownership = 'Public';
                	accRecord.Type = 'customer-direct';
                	accRecord.AnnualRevenue = 7800000; 
                        accRecord.Rating='Cold';
                        
                      
               	// Add the Record to Collection
               	accountsToUpdate.Add(accRecord);
      	      }            
            // Update the Records to Database
            if (! accountsToUpdate.isEmpty())
                Update accountsToUpdate;
        }
    }    
Global void Finish (Database.BatchableContext bContext)
    {
        System.debug('Batch Job Id is: '+ bContext.getJobId());
     AsyncApexJob jobDetails = [Select id, Status, totalJobItems, jobItemsProcessed, 
                                  			numberOfErrors, CreatedBy.Email
                                  	from AsyncApexJob Where id =: bContext.getJobId()];        
        // Send the Results to the Users through Email Alert
        // 
        // 
        Messaging.SingleEmailMessage sEmail = new Messaging.SingleEmailMessage();
       String[] toAddress = new String[]{jobDetails.CreatedBy.Email, 'praveenbuddi0@gmail.com'};
            sEmail.setToAddresses(toAddress);        
        	sEmail.setSenderDisplayName('DIGITAL-LYNC Customer Support Center.');
           	sEmail.setReplyTo('support@Digital.com');       
        	String emailSubject = 'Customer Details Update Batch Job Status Notification - UpdateAccountRecordsBatch ( '+ bContext.getJobId()+ ' )';
        	sEmail.setSubject(emailSubject);        
        	String emailContent = 'Dear Customer Support Team, <br/><br/> '+
                		'We are pleased to Inform you, that Weekly Customer Details Update Batch Job has been Processed Successfully. <br/><br/>'+
                		'Here are the Batch Job Results...: <br/><br/>'+
                		'Batch Job Id is.....: '+ bContext.getJobId()+
                		'<br/>Batch Job Name is.....: UpdateAccountRecordsBatch'+
                		'<br/>Batch Job Status is......: '+ jobDetails.Status+
                		'<br/>Total Number Of Batches Available...: '+ jobDetails.TotalJobItems+
                		'<br/>Number of Batches Processed....: '+ jobDetails.JobItemsProcessed+
                		'<br/>Number of Batches Failed......: '+ jobDetails.NumberOfErrors+
                		'<br/>Batch Job Owner Email Address.....: '+ jobDetails.CreatedBy.Email+
                		'<br/><br/> Please Contact on the below address, if any queries. <br/><br/>'+
                		'***<i>This is a System-Generated Email. Please Do Not Reply.</i><br/><br/>'+
                		'Thanks & Regards, <br/>Customer Support Center, <br/>DIGITAL-LYNC Inc.';        
        	sEmail.setHtmlBody(emailContent);        	
        	Messaging.sendEmail(new Messaging.SingleEmailMessage[]{sEmail});        
    }
}