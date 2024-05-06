import { LightningElement } from 'lwc';

export default class OnClickfunction extends LightningElement {

    greeting='';


    handleClick(event)
    {
        this.greeting = this.template.querySelector("lightning-input").value;
    }
}