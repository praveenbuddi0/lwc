public class DynamicSosl{
    Public static void SearchDynamicRecords(String searchText) 
    { 
        if(searchText != Null && searchText != '')  
        { 
            String dynamicSOSLQuery = 'FIND '+' \' '+ searchText +'*'+' \' '+
                ' IN ALL FIELDS  RETURNING ' + 
                'Account(Id, Name, Rating, Industry, AnnualRevenue, Phone, Fax),' + 
                'Lead(ID, FirstName, LastName, Title, Company, Status, Phone, Fax),'+ 
                'Opportunity(Id, Name, Amount, CloseDate, StageName, Probability),'+ 
                'Case(Id, CaseNumber, Status, Priority, Origin, Reason, Subject)'  ;

            List<List<SObject>> lstRecords = Search.query(dynamicSOSLQuery);   
  
            if(! lstRecords.isEmpty())
            { 
                List<Account> lstAccounts = (List<Account>) lstRecords.Get(0); 
                List<Lead> lstLeads = (List<Lead>) lstRecords.Get(1); 
                List<Opportunity> lstOppty = (List<Opportunity>) lstRecords.Get(2); 
                List<Case> lstCases = (List<Case>) lstRecords[3]; 
                
                System.debug('Number of Account Records.....: '+ lstAccounts.Size()); 
                for(Account acc : lstAccounts) 
                { 
                    System.debug('Account Record is....: '+ acc); 
                } 
                
                System.debug('--------------------------------------------'); 
                System.debug('Number of Lead Records.......: '+ lstLeads.size());  
                for(Lead ldRecord : lstLeads){ 
                    System.debug('Lead Record is....: '+ ldrecord); 
                } 
                
                System.debug('--------------------------------------------');  
                System.debug('Number of Opportunity Records ......: '+ lstOppty.Size());  
                for(Opportunity oppty : lstOppty){ 
                    System.debug('Opportunity Record is...: '+ oppty); 
                } 
                
                System.debug('---------------------------------------------'); 
                System.debug('Number of Case Records .......: '+ lstCases.Size());  
                for(Case csRecord : lstCases) {
                System.debug('Case Record is.....: '+ csRecord); 
                } 
                System.debug('--------------------------------------------'); 
            } 
        } 
    } 
}