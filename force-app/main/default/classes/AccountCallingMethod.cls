public class AccountCallingMethod {

    public static void Createacc(){
        List<Account> accList = new List<Account>();
        for(integer i=1;i<=3;i++){
            Account acc = new Account();
            acc.Name = 'Ram'+i;
            acc.Phone = '989872'+i+'89'+i;
            acc.Rating = 'Hot';
            accList.add(acc);
        }
        insert accList;
        AccountCallingMethod.createcontacts(accList);
    }
    public static void createcontacts(List<Account> accList){
        List<Contact> conList = new  List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            con.Phone = acc.Phone;
            con.Email = acc.Name+'@gmail.com';
            conList.add(con);
        }
        insert conList;
        system.debug('con :'+conList);
    }


}