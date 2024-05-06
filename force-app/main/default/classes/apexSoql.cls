public class apexSoql {
    public static void getRecord(){
        list<Account> lstAcc = [SELECT Id,Name,Rating,Industry FROM Account];
        system.debug('the size of the List ---'+lstAcc.size());
        if(!lstAcc.isEmpty()){
            for(Account Acc : lstAcc){
              system.debug('the elemnts are:---'+Acc.Id);
                system.debug('the Name of the elemnets---'+Acc.Name);
                system.debug('-------------------------------------------');
            }
        }
    }
}