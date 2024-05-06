import { LightningElement } from 'lwc';
export default class Helloworld extends LightningElement {
     world="helllo world";

    handlechange(event){
        this.world = event.target.value;
    }


}