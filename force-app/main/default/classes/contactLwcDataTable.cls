public  with sharing class contactLwcDataTable {
        // RelatedAccountContacts 
   
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactRecords(String accountId){
        List<Contact> contactList = new List<Contact>();

        system.debug('accountId : '+accountId);

        try {

            if(accountId!=null){
                contactList = [Select id,Email,Name,Phone,Account.Name,Owner.Name from Contact where AccountId=:accountId];
            }
            
            system.debug('contactList :'+contactList);
            
            return contactList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}