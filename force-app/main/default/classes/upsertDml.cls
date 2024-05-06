public class upsertDml {
    public static void upsertRecords(){
        List<Case> upsertToCase = new List<Case>();
        List<Case> lstCase =[SELECT Id,status,CaseNumber,priority FROM Case WHERE status = 'NEW'];
        if(lstCase != NULL){
            for(Case cs : lstCase){
                cs.priority = 'Medium';
                upsertToCase.add(cs);
            }
        }
        Case cs = New Case();
        cs.Status = 'New';
        cs.priority = 'Low';
        cs.origin = 'web';
        cs.Reason = 'performence';
        cs.Subject = 'This is new Case Record Credated with Apex Program';
        upsertToCase.add(cs);
        if(!upsertToCase.isEmpty()){
           upsert upsertToCase ;
        }
    }
}