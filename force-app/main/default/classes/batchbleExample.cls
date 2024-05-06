Global class batchbleExample Implements Database.batchable<sObject>{
    Global Database.queryLocator start(Database.batchableContext bContext){
        string accQuery = 'SELECT Id,Name,Rating,Industry,Type FROM Account';
        return database.getQueryLocator(accQuery);
    }
    Global void Execute(Database.batchableContext bContext, List<sObject> lstRec){
        if(!lstRec.isEmpty()){
        List<Account> AccRec = new List<Account>();
            For(sObject obj : lstRec){
                Account Acc = (Account) obj;
                Acc.Rating = 'Cold';
                Acc.Industry = 'Energy';
                Acc.Type = 'Prospect';
                AccRec.add(Acc);
            }
            if(!AccRec.isEmpty())
                update AccRec;
        }
    }
    Global Void Finish(Database.batchableContext bContext){
        system.debug('the Batch Job Id,,,...'+bContext.getJobId());
        AsyncApexJob JobDetails =[SELECT Id,Status,totalJobItems,jobitemsprocessed,numberoferrors,Createdby.Email From AsyncApexJob WHERE Id =:bContext.getJobId()];
    }  
}