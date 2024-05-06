public class dynamicSoql {
    public static void getAccount(string value){
        string AccQuary = 'SELECT Id,Phone,Industry,Rating FROM Account WHERE Industry =: value';
        list<Account> AccQ = Database.Query(AccQuary);
        system.debug(' the size of the account '+AccQ.size());
        if(!AccQ.isEmpty()){
            for(Account A :AccQ){
                system.debug('the Account Id ---'+A.Id);
                system.debug('the Acoount Industry---'+A.Industry);
                system.debug('the Account Phone---'+A.Phone);
                System.debug('-------------------------------------------');
            }
        }
    }
}