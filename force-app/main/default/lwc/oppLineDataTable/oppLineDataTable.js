import { LightningElement,api,wire ,track} from 'lwc';

import { updateRecord } from 'lightning/uiRecordApi';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from "@salesforce/apex";

import getopplineitems from '@salesforce/apex/oppLineDataTalehelper.getopplineitems';


const columns = [
    { label: 'Opportunity Product Name', fieldName: 'Name' },
    { label: 'Quantity', fieldName: 'Quantity', type: 'Number' },
    { label: 'Sales Price', fieldName: 'UnitPrice', type: 'Currency', editable: true},
    { label: 'List Price', fieldName: 'ListPrice', type: 'Currency', editable : true},
    { label: 'Discount Type', fieldName: 'Discount_Type__c', type: 'pickList', editable: true},
    {
        type: 'button-icon',
        typeAttributes:
        {
            iconName: 'utility:delete',
            name: 'delete',
            iconClass: 'slds-icon-text-error'
        }
    }
    
];

export default class OppLineDataTable extends LightningElement {

    columns = columns;
    refreshtable;

    showme = false;
    norecords = false;

    @track opplineitems = [];
    @track fldsItemValues = [];

    @api recordId;
    
    @wire(getopplineitems,{recId :'$recordId'})
     opplineitemsdata(response){
         this.refreshtable = response;
        if(response){
            //console.log('data :'+JSON.stringify(data))
            this.opplineitems = response.data;
            console.log('dataToRefresh :'+JSON.stringify(response.data));
        }  
     }
     
     handleRowAction(event){
        let olircdId = event.detail.row.Id;
        console.log('index :'+olircdId);
        if(event.detail.action.name === 'delete'){
            deleteRecord(olircdId).then(result=>{
                    this.showToastMessage('Success' , 'OLI record Deleted Successfully','Record Deleted');

                    //Refresh Data
                    refreshApex(this.refreshtable);
            })
            
        }
        
     }

     handleSave(event) {
        this.fldsItemValues = event.detail.draftValues;
        /*let olircdId = event.detail.row.id;
        console.log('olircdId ;',olircdId);*/
        console.log('draft values :'+JSON.stringify(this.fldsItemValues.slice()));
        const inputsItems = this.fldsItemValues.slice().map((draft) => {
            const fields = Object.assign({}, draft);
            return { fields };
        });
        console.log('fields :',JSON.stringify(inputsItems));

        const promises = inputsItems.map(recordInput => updateRecord(recordInput));
        Promise.all(promises).then(res => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Records Updated Successfully!!',
                    variant: 'success'
                })
            );
            
            refreshApex(this.refreshtable);
            
        }).catch(error => {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'An Error Occured!!',
                    variant: 'error'
                })
            );
        }).finally(() => {
            this.fldsItemValues = [];
        });
    }

     showToastMessage(variant, message, title) {
        this.dispatchEvent(
            new ShowToastEvent({
                title: title,
                message: message,
                variant: variant
            })
        );
    }

}
