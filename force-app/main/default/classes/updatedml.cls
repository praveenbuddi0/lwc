public class updatedml {
    public static void updateRecords(){
        List<Account> AccRec = [SELECT Id,Name,Rating,Annualrevenue FROM Account 
                                WHERE Rating ='Cold'];
        if(AccRec != NULL){
            for(Account Acc :AccRec){
                Acc.Rating = 'Hot';
                Acc.Annualrevenue = 990000;
            }
            update AccRec ;
        }
    }
}