import { LightningElement,api,wire } from 'lwc';
import getContacts from '@salesforce/apex/wireApexLwc.getContacts';

export default class WireApexLwc extends LightningElement {

    @api recordId;


   @wire(getContacts,{accId:'$recordId'})
    contacts;
}