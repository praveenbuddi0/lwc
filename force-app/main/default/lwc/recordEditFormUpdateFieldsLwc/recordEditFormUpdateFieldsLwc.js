import { LightningElement, api } from 'lwc';

import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class RecordEditFormUpdateFieldsLwc extends LightningElement {




    @api recordId;
    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
         this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contact recod is created sucessfully with an Id :'+ event.detail.id,
                variant: 'success',
            }),
        ); 
       
    }
    handleSuccess(event) {
        console.log('onsuccess event recordEditForm', event.detail.id);
        
       
    }
}