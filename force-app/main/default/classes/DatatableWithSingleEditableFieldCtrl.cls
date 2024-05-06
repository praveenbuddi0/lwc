public with sharing class DatatableWithSingleEditableFieldCtrl {
  @AuraEnabled(cacheable=true)
  public static Marolix__c[] getRecords() {
    try {
      return [
        SELECT Name, Phone__c, Email__c, Date_Of_Birth__c
        FROM Marolix__c
        WITH SECURITY_ENFORCED
        LIMIT 10
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
/*
  @AuraEnabled
  public static String updateRecords(Object recordsJson) {
    try {
      List<Marolix__c> MarolixList = (List<Marolix__c>) JSON.deserialize(
       JSON.serialize(recordsJson),
        List<Marolix__c>.class
      );
        if(!MarolixList.isEmpty()){
            update MarolixList;
            return 'sucess';
        }
        return 'faul';
      
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
  */
      @AuraEnabled

    public static void updateRecords(List<Marolix__c> listOfAccounts){

        try {

            for(Marolix__c a: listOfAccounts){

               

                System.debug('----');

            }

            update listOfAccounts;

        } catch (Exception e) {

            throw new AuraHandledException(e.getMessage());

        }

    }
}