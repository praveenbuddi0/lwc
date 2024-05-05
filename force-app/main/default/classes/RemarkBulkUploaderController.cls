public with sharing class RemarkBulkUploaderController {
   // RemarkBulkUploaderController.cls

    @AuraEnabled
    public static void insertRemarks(List<String> remarks) {
        try {
            List<Pre_Construction_Step__c> recordsToInsert = new List<Pre_Construction_Step__c>();

            for (String remark : remarks) {
                recordsToInsert.add(new Pre_Construction_Step__c(Remark__c = remark));
            }

            insert recordsToInsert;
        } catch (Exception e) {
            // Handle exception
            throw new AuraHandledException('Error inserting remarks: ' + e.getMessage());
        }
    }
}

