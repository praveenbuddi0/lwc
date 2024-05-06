public  with sharing class MarolixController {
     @AuraEnabled(cacheable=true)
    public static List<Marolix__c> getMarolixRecords() {
        return [SELECT Id, Name, Phone__c, Email__c, Date_Of_Birth__c FROM Marolix__c LIMIT 10];
    }


    @AuraEnabled
    public static void updateMarolixRecords(List<Marolix__c> marolixRecords) {
        update marolixRecords;
    }
}