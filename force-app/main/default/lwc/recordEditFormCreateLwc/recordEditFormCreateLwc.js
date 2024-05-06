import { LightningElement } from 'lwc';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';
export default class RecordEditFormCreateLwc extends LightningElement {

handleSuccess(event) {
        console.log('onsuccess event recordEditForm',event.detail.id)
    }
    handleSubmit(event) {
        console.log('onsubmit event recordEditForm'+ event.detail.fields);
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Contact recod is created sucessfully with an Id :'+ event.detail.Id,
                variant: 'success',
            }),
        );
    }
}