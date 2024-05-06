import { LightningElement } from 'lwc';

import createMarolixrcd from '@salesforce/apex/modelPopupHandler.createMarolixrcd';
export default class ModelPopupInsertCustomerRecord extends LightningElement {
    


    isShowModal = false;
      namevar = null;
      phonevar = null;
      emailvar = null;

      showModalBox(event){
        this.isShowModal = true;
    }

    handlechange(event){
        let val = event.target.name;
        console.log('val :'+this.namevar);
        if(val === 'name'){
            this.namevar = event.target.value;
            console.log('namevar :'+this.namevar);
        }else if(val === 'phone'){
            this.phonevar = event.target.value;
            console.log('phonevar :'+this.phonevar);
        }else if(val === 'email'){
            this.emailvar = event.target.value;
            console.log('emailvar :'+this.emailvar);
        }
    }
    
    
    hideModalBox(event){
        this.isShowModal = false;
    }
    handleclick(event){
        const wrpobj = {
            Name : this.namevar,
            Phone : this.phonevar,
            Email : this.emailvar
        }
        console.log('wrpobj :'+JSON.stringify(wrpobj));
        createMarolixrcd({wrp : wrpobj}).then(response=>{
            alert('response :'+response.Id);
        }).catch(error=>{
            alert('error :'+error.body.message);
        })
    }
}