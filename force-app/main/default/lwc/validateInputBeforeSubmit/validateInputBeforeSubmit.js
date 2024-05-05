import { LightningElement } from 'lwc';

export default class ValidateInputBeforeSubmit extends LightningElement {
   
    nameval;
    emailval;
    msgval;
    Emailvalidate;
    Namevalidate;
    msgvalidate;
    handlechange(event){
        const nameRegex = /^[A-Za-z]+$/;
        const emailRegex = /^[a-zA-Z0-9._a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]{2,4}$/;
        const nameval = event.target.name;
        if(nameval === 'name'){
            this.nameval = event.target.value;
            if(nameRegex.test(this.nameval)){
                this.Namevalidate = 'valid Name';
            }else{
                this.Namevalidate = 'Please enter valid Name';
            }
        }else if(nameval === 'email'){
            this.emailval = event.target.value;
            if(emailRegex.test(this.emailval)){
                this.Emailvalidate = ' valid Email';
                
            }else{
                this.Emailvalidate = ' Please enter valid Email';
            }
        }else if(nameval === 'msg'){
            this.msgval = event.target.value;
            let msglength = this.msgval.length;
            if(msglength > 20){
                this.msgvalidate = 'Max 20 Characters Allowed';
            }else{
                this.msgvalidate = '';
            }
        }
    }

    /*handleEmailValidation() {
        console.log('Clicked');
        const nameRegex = /^[A-Za-z]+$/;
        const emailRegex = /^[a-zA-Z0-9._a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]{2,4}$/;
        //emailValidate
        if(emailRegex.test(this.emailval)){
            this.Emailvalidate = ' valid Email';
            
        }else{
            this.Emailvalidate = ' Please enter valid Email';
        }
        //Name
        if(nameRegex.test(this.nameval)){
            this.Namevalidate = 'valid Name';
        }else{
            this.Namevalidate = 'Please enter valid Name';
        }

        
    }*/

}
