public class EmailProgram{
    public static void leadRecord(){
        Lead ld = new Lead();
        ld.FirstName = 'uday';
        ld.LastName = 'Email ';
        ld.Status = 'Open - Not Contacted';
        ld.Email = 'udaykiran.marolix@gmail.com';
        ld.AnnualRevenue = 989898989 ;
        ld.Rating = 'Hot' ;
        ld.Company ='Marolix';
        insert ld;
        if(ld.Id != NULL){
            system.debug('The Lead is Created With an Id -- '+ld.Id);
           EmailLead(ld); 
        }
    }
    public static void EmailLead(Lead ld){
        system.debug('the LEAD---'+ld);
        if(ld.Id != NULL && ld.Email != NULL){
            Messaging.SingleEmailMessage  SingleEmail = new Messaging.SingleEmailMessage();
            string[] toAddresse= new string[]{ld.Email};
                 system.debug('the ToAdress---'+ld.Email);
                SingleEmail.setToAddresses(toAddresse);
            
            list<string> ccAddresses = new list<string>{'praveenbuddi0@gmail.com'};
                SingleEmail.setCcAddresses(ccAddresses);
            SingleEmail.setSenderDisplayName('-- HI This Apex Email --');
            SingleEmail.setReplyTo('reply@marolix.com');
            string emailSubject = 'Hello New Customer '+ld.FirstName +' '+ld.LastName +'.!!';
            SingleEmail.setSubject(emailSubject);
            
            String emailContent = 'Dear '+ ld.FirstName + ' '+ ld.LastName + ',<br/><br/>'+ 
							      'Thanks for Showing your Interest in our Banking Services. <br/><br/>'+
                                  'We are Pleased to  inform you that your Personal Loan Application has been Submitted Successfully. <br/><br/>'+
                                  'Your Loan Application is under Process, one of our Relationship Manager will  contact you shortly. <br/><br/>'+ 
                                  'Here are your Loan Application Details....: <br/><br/>'+ 
                'Loan Application Number ......:' + ld.Id + 
                '<br/>Applicant Name is.......: '+ ld.FirstName + ' '+  ld.LastName+ 
			    '<br/>Email Address .........: '+ ld.Email+ 
                                   
                  
     '<br/><br/>***<i>This is a System-Generated Email. Please Do Not  Reply.</i>*** <br/><br/>'+ 'Thanks & Regards, <br/> ICICI Bank Personal Loans, <br/>  Contact us: +1 (800)787-8899, <br/> Email us: loans@icicibank.com'; 
            SingleEmail.setHtmlBody(emailContent); 
            
            Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
            attach.setFileName(ld.FirstName + ' '+ld.LastName);
            attach.setContentType('Application/Pdf');
            attach.body = Blob.toPdf(emailContent);
            
            Messaging.EmailFileAttachment attach2 = new Messaging.EmailFileAttachment();
            attach2.setFileName(ld.FirstName + ' '+ld.LastName);
            attach2.setContentType('Application/Pdf');
            attach2.body = Blob.toPdf(emailContent);
            List<Messaging.EmailFileAttachment> lstAttach = new List<Messaging.EmailFileAttachment>();
            lstAttach.add(attach);
            lstAttach.add(attach2);
            
            
            SingleEmail.setFileAttachments(lstAttach);
            
            
            Messaging.SendEmailResult[] results = Messaging.SendEmail(new Messaging.SingleEmailMessage[]{SingleEmail});
        }
    }
}