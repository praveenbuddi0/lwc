public class mergeDml {
    public static void mergeRecords(){
        Account Acc1 = [SELECT Id,Name,Rating,Annualrevenue FROM Account WHERE Name LIKE '%m1' LIMIT 1];
        Account Acc2 = [SELECT Id,Name,Rating,Annualrevenue FROM Account WHERE Name LIKE '%m3' LIMIT 1];
        if(Acc1 != NULL && Acc2 !=NULL){
            merge Acc1 Acc2 ;
        }
    }
}