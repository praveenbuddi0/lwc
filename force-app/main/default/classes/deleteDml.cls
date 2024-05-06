public class deleteDml {
    public Static void deleteRecord(string value){
        if(value != Null && value != ''){
            value += '%';
            list<lead> leadList = [SELECT Id, LastName FROM Lead 
                                   WHERE LastName LIKE :value ];
            if(!leadList.isEmpty()){
                Delete leadList ;
            }
        }
    }

}