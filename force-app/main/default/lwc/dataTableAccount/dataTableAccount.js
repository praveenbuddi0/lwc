import { LightningElement,api,wire } from 'lwc';

import getContactRecords from '@salesforce/apex/contactLwcDataTable.getContactRecords';
export default class DataTableAccount extends LightningElement {

// RelatedAccountContacts 
     columns = [
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Name', fieldName: 'Name', type: 'text' }
    ];
    
    @api recordId; 
    contactList;

    @wire(getContactRecords,{accountId:'$recordId'})
    contactListRec({data,error}){
        
        if(data){
            console.log('data : ',data);
            this.contactList = data;
        }else if(error){
            console.log('error',error);
        }
    }
}