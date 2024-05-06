public class AccountInsertClass {
    public Static void AccInsert(){
        Account Acc = New Account();
        Acc.Name = 'Test Class';
        Acc.Phone = '234509876';
        Acc.Industry = 'Banking';
        Insert Acc;
        system.debug('the Account Inserted With Id---'+Acc.Id);
    }
}