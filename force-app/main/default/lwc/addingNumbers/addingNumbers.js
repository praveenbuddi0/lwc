import { LightningElement } from 'lwc';

export default class AddingNumbers extends LightningElement {
   
     Result = 0;
     
    handleclick(event){
        const numval = event.target.name;
        console.log('number :'+typeof (numval));
        const number = parseInt(numval);
        console.log('number :'+typeof (number));
        this.Result = this.Result + number;
        console.log('Result :'+this.Result);
        
        
    }
    
    handleClick(){
        this.Result = 0;
    }
 
}
