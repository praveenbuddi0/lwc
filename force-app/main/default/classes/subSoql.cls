public class subSoql {
    public static void subRecords(string value){
        if(value != NULL && value != ''){
        list<Account> AccList = [SELECT Id,Name,Industry,AnnualRevenue,Rating, 
                                (SELECT Id,FirstName,LastName,Phone,Email FROM Contacts) 
                                 FROM Account WHERE Name =: value];
        if(!AccList.isEmpty())
        {
            for(Account Acc : AccList){
            system.debug('the Account id---'+Acc.id);
                system.debug('the Account Name---'+Acc.Name);
                system.debug('the Account Industry---'+Acc.Industry);
                system.debug('the Account Rating---'+Acc.Rating);
                system.debug('the Account AnnualRevenue---'+Acc.AnnualRevenue);
                List<Contact> ConList = Acc.Contacts;
                if(!ConList.isEmpty()){
                    for(Contact Con : ConList){
                        system.debug('The contacts are---'+Con);
                    }
                }
           }
        }
        } 
        system.debug('Number of Soql Quries Used ---'+System.Limits.getQueries());
        system.debug('Number of Records Fetched-----'+System.Limits.getQueryRows());
    }
}