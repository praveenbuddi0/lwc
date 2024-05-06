import { LightningElement } from 'lwc';

import BackgroundImg from '@salesforce/resourceUrl/salesforceimage';

export default class ImageInsert extends LightningElement {

    imageUrl = BackgroundImg;
   /*
    get getBackgroundImage(){
        return `background-image:url("${this.imageUrl}")`;
    }

    */
}