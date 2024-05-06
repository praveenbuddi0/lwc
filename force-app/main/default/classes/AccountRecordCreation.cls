public class AccountRecordCreation {
    
    public static Void RecordCreation(){
       List<Account> listAcc= new List<Account>();  // arrays ---collections---List,Set,Map
       // Account[]    ArrayAcc= new Accunt[];
        For(Integer Count=1; Count<=4 ; Count++ ){
         Account Acc = New Account(); // object intialization
          /*  Marolix__c M1 = new Marolix__c();
            M1.Phone__c = '1239990009';  */
        Acc.Name ='Orange'+ Count;
        Acc.AccountNumber= '12345987';
        Acc.Industry='Banking';
        Acc.Rating='Hot';
                     ListAcc.Add(Acc); // Acc1,Acc2,Acc3,.....
         }
        Insert listAcc;
      // Insert Acc;
       // System.Debug('New Account Created with id '+Acc.Id);
        if(!listAcc.isEmpty()){
        System.debug('New Account Created with an Id----'+listAcc);
        }
        
        List<Contact> listCon = new list<Contact>();
        for(Account A : listAcc){
        Contact Con = New Contact();
        Con.AccountId = A.Id;
        Con.FirstName = 'Red Contact';
        Con.LastName = 'New';
        Con.Phone = '123456';
            listCon.add(Con); // Con1, Con2, Con3....
        }
		//insert Con;
       Insert listCon;
       if(!listCon.isEmpty()){
          system.debug('the New contact with id' + listCon);
       }
    }
}