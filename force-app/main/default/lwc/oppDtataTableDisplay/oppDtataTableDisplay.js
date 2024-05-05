import { LightningElement,wire,api } from 'lwc';

import { updateRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getopplineitems from '@salesforce/apex/oppLineItemDataTable.getopplineitems';



const columns = [
    { label: 'Opportunity Product Name', fieldName: 'Name' },
    { label: 'Quantity', fieldName: 'Quantity', type: 'Number' },
    { label: 'Sales Price', fieldName: 'UnitPrice', type: 'Currency' },
    { label: 'List Price', fieldName: 'ListPrice', type: 'date' },
    { label: 'Discount', fieldName: 'Discount', type: 'Percent', editable: true}
    
];
export default class OppDtataTableDisplay extends LightningElement {
    saveDraftValues;
    columns = columns;
    
    @api recordId;

    @wire(getopplineitems,{recId :'$recordId'}) opplineitems;

    

}