public class childToParentSoql {
    public static void getCaserecords(string caseNumber){
        if(caseNumber != NULL && caseNumber != ''){
            List<Case> lstCase = [SELECT Id,casenumber,status,priority, subject,
                                 Contact.Firstname,Contact.Lastname,Contact.Email,Contact.Phone,
                                 Contact.Account.Name,Contact.Account.Rating,Contact.Account.Industry,
                                 Contact.Account.Owner.FirstName,Contact.Account.Owner.LastName,
                                 Contact.Account.Owner.Profile.Name,Contact.Account.Owner.Profile.Userlicense.name
                                 FROM Case WHERE casenumber =: caseNumber];
            system.debug('Number of case records return --'+lstCase.size());
            if(!lstCase.isEmpty()){
                for(Case cs : lstCase){
                    system.debug('the Case Id -- '+cs.Id);
                    system.debug('the CaseNumber is--'+cs.casenumber);
                    system.debug('the Case Status is---'+cs.Status);
                    system.debug('the Case priority---'+cs.priority);
                    system.debug('the subjecct ==='+cs.subject);
                    system.debug('the Contact name of case--'+cs.Contact.FirstName +' '+ cs.Contact.LastName);
                    system.debug('the Contact Phone--'+cs.Contact.Phone);
                    system.debug('the Contact Email--'+cs.Contact.Email);
                    system.debug('the Account Name --'+cs.Contact.Account.Name);
                    system.debug('the Account Rating--'+cs.Contact.Account.Rating);
                    system.debug('the Account Industry---'+cs.Contact.Account.Industry);
                    system.debug('the Case Owner--'+cs.Contact.Account.Owner.Firstname + ' '+ cs.Contact.Account.Owner.LastName);
                    system.debug('the Case Profile Name is---'+cs.Contact.Account.Owner.Profile.Name);
                    system.debug('the Case Profile License Name is--'+cs.Contact.Account.Owner.Profile.userlicense.Name);
                }
            }
        }
    }
}