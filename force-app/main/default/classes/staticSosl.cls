public class staticSosl {
    public static void soslMethod(){
        List<List<sObject>> listRecords = [FIND 'Orange*' IN ALL FIELDS RETURNING
                                            Account(Id,Rating,Name,Phone,Industry),
                                            Lead(Id,Company,LastName,Status,Phone)];
        if(!listRecords.isEmpty()){
            List<Account> lstAcc =(List<Account>) listRecords.get(0);
            List<Lead> lstLead =(List<Lead>) listRecords.get(1);
            system.debug('Number of Records Retrived ---'+ listRecords.size());
            system.debug('the Number of Account Records Fetched '+ lstAcc.size());
            for(Account Acc : lstAcc){
                system.debug('the Accounts Are --'+Acc);
            }
            system.debug('---------------------------');
            system.debug('the Lead Records Fetched --'+lstLead.size());
            for(Lead ld : lstLead){
                system.debug('the Leads Are--'+ld);
            }
        }
    }
}