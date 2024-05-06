public class undeleteDml {
    public static void undeleteRecord( string value){
        if(value != NULL && value != ''){
            undelete [SELECT Id,LastName,isdeleted FROM Lead
                      WHERE isdeleted = true AND LastName LIKE : value +'%' ALL ROWS];
        }
    }

}