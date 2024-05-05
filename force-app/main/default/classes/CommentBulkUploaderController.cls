public with sharing class CommentBulkUploaderController {
    
        // RemarkBulkUploaderController.cls
     
         @AuraEnabled
         public static void insertComments(List<String> comments) {
             try {
                 List<Pre_Construction_Step__c> recordsToInsert = new List<Pre_Construction_Step__c>();
     
                 for (String remark : comments) {
                     recordsToInsert.add(new Pre_Construction_Step__c(Comments__c = remark));
                 }
     
                 insert recordsToInsert;
             } catch (Exception e) {
                 // Handle exception
                 throw new AuraHandledException('Error inserting remarks: ' + e.getMessage());
             }
         }
     }
     
