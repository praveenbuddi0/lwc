public class HandlerClass {
    public void AfterUpdate(List<Contact> newContact, Map<Id,Contact> oldContactMap){
        List<Account> AccUpdate = new List<Account>();
        For(Contact Con : newContact){
            if(Con.Phone != oldContactMap.get(Con.Id).Phone){
                Account RelatedAccount = [SELECT Id,Name,Phone FROM Account WHERE Id =: Con.AccountId];
                RelatedAccount.Phone = Con.Phone;
                AccUpdate.add(RelatedAccount);
            }
        }
        if(!AccUpdate.isEmpty()){
            update AccUpdate;
        }
    }
}