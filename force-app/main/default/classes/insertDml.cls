public class insertDml {
    public static void insertRecord(){
        lead ld = new lead();
        
        ld.FirstName = 'Charan';
        ld.LastName = 'Ram';
        ld.LeadSource = 'web';
        ld.Company = 'IT';
        ld.Status = 'Open - Not Contacted';
        
        
        insert ld ;
        if(ld.Id != NULL)
            system.debug('the lead created with Id--'+ ld.Id);
        
    }

}