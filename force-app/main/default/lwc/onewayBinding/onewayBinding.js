import { LightningElement } from 'lwc';

export default class OnewayBinding extends LightningElement {
    name='';
    greeting='';


    handleChange(event)
    {
        this.name = event.target.value;
        this.greeting = event.target.value;
    }
}