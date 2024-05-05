import { LightningElement } from 'lwc';

export default class ValidationPassword extends LightningElement {
    nameval = '';
    passval = '';
    show = false;
    handlechange(event){
        const nameinput = event.target.name;
        if(nameinput === 'name'){
            this.nameval = event.target.value;
        }else if(nameinput === 'pass'){
            this.passval = event.target.value;
        }
    }

    handleclick(event){
        const pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\]).{8,}$/;
        if(!pattern.test(this.passval)){
            this.show=true;
            this.passval = '';
            this.nameval = '';
        }else{
            this.show=false;
            this.passval ='' ;
            this.nameval = '';
        }
        
    }
}