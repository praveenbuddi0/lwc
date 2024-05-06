public class JobApplicationMail {

    public static void ApplicationForJOb(List<Job_Application__c> ListJob){
        Set<Id> newIds = new Set<Id>();
        For(Job_Application__c jobApp : ListJob){
            newIds.add(jobApp.Id);
        }
        Map<Id,Integer> mapcount = new Map<Id, Integer>();
        List<AggregateResult> AggList = [SELECT job__c, Count(Id) jobAppCount 
                                         FROM Job_Application__c
                                        WHERE job__c IN :newIds
                                        GROUP BY job__c];
        set<Id> jobSend200 = new Set<Id>();
        Set<Id> jobSend300 = new Set<Id>();
        
        For(AggregateResult AggRes : AggList){
            ID jobId = (ID)AggRes.get('job__c');
            Integer jobAppCount = (Integer)AggRes.get('jobAppCount');
            mapcount.put(jobId, jobAppCount);
            
             If(jobAppCount > 200){
                jobSend200.add(jobId);
            }
            If(jobAppCount > 300){
                jobSend300.add(jobId);
            }
        }
        sendEmailToJobOwner(jobSend200,200);
        sendEmailToJobOwner(jobSend300,300);
        
        
        
        
        
        
        
    /*    For(Job_Application__c jobApp2 : ListJob){
            If(mapcount.containskey(jobApp2.job__c) &&mapcount.get(jobApp2.job__c) > 200){
                jobApp2.AddError('mmore tha 200 Applications');
            }
        }
*/
    
    }
    
    Private static void sendEmailToJobOwner(set<Id> jobIds, Integer threshold){
        List<EmailMessage> emailtosend = new List<EmailMessage>();
        
    }
    
    
}