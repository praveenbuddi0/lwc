public class modelPopupHandler {

    public class wrpclass{
        @auraEnabled
        public string Name{get;set;}
        @auraEnabled
        public string Phone{get;set;}
        @auraEnabled
        public string Email{get;set;}
    }
    @AuraEnabled
    public static Customers__c createMarolixrcd(wrpclass wrp){
        Customers__c c = new Customers__c();
        if(wrp != null){
            system.debug('wrp :'+wrp);
            c.Name = wrp.Name;
            c.Phone__c = wrp.Phone;
            c.Email__c = wrp.Email;
            insert c;
            system.debug('values :'+c);
        }
        return c;
    }
}