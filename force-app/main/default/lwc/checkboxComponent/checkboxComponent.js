import { LightningElement } from 'lwc';
export default class CheckboxComponent extends LightningElement {
    showme= false;
    //ckeckbox;
   // value= 'am not visble';
    handlechange(event){
      
       // this.ckeckbox = event.target.checked;
       // this.value = 'visible';
       this.showme = event.target.checked;
    }

    

}