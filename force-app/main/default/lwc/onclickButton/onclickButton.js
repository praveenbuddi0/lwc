import { LightningElement } from 'lwc';
export default class OnclickButton extends LightningElement {
    greeting;
    test;

    handlechange(event){
        this.test = event.target.value;
    }
    handleClick(){
        this.greeting = this.test;
        this.test = '';
    
    }

   
    


}