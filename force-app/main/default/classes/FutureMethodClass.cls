public class FutureMethodClass {
    public static void userUpdate(){
        user userToUpdate = [SELECT Id,Firstname,Lastname,Username,isActive FROM User
                             WHERE Username ='praveenbuddi123@gmail.com' AND isActive = true];
        if(userToUpdate!= Null) {
            userToUpdate.Username ='praveenbuddi1234@gmail.com';
            update userToUpdate;
            // Calling the Second method to this method
            AccInsert();
        }
    }
    @Future()
    public static void AccInsert(){
        Account Acc= new Account();
        Acc.Name = 'Future Record';
        Acc.Phone= '1234567890';
        Acc.Industry = 'Banking';
        Insert Acc;
    }
}