public with sharing class bulkCommmentFieldUpdateClass {
  
        @AuraEnabled(cacheable=true)
        public static Pre_Construction_Step__c[] getRecords() {
          try {
            return [
              SELECT Name, Comments__c, Remark__c, Step_Name__c
              FROM Pre_Construction_Step__c
              WITH SECURITY_ENFORCED
              LIMIT 10
            ];
          } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
          }
        }
      
        @AuraEnabled
        public static void updateRecords(String recordsJson) {
          try {
            List<Pre_Construction_Step__c> objlist = (List<Pre_Construction_Step__c>) JSON.deserialize(
              recordsJson,
              List<Pre_Construction_Step__c>.class
            );
      
            update objlist;
          } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
          }
        }
      
}