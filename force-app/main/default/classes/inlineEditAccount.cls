public with sharing class inlineEditAccount {


    @AuraEnabled(cacheable=true)

    public static List<Account> getAccounts(){

        return [SELECT Name,NumberOfEmployees,AnnualRevenue,

                Rating,Industry FROM Account WITH SECURITY_ENFORCED LIMIT 6];

    }

    @AuraEnabled

    public static void updateAccounts(List<Account> listOfAccounts){

        try {

            for(Account a: listOfAccounts){

                System.debug(a.NumberOfEmployees);

                System.debug(a.AnnualRevenue);

                System.debug('----');

            }

            update listOfAccounts;

        } catch (Exception e) {

            throw new AuraHandledException(e.getMessage());

        }

    }

}