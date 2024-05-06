import { LightningElement } from 'lwc';
export default class ValidatePassword extends LightningElement {
   validatepass;
    nameval;
    passval;
    show = false;
    handlechange(event){
        const nameinput = event.target.name;
        if(nameinput === 'name'){
            this.nameval = event.target.value;
        }else if(nameinput === 'pass'){
            this.passval = event.target.value;
            console.log('the pass word passval');
        }
    }

    handleclick(event){
        //let pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\]).{8,}$/;
       /* const lowercaseRegex = /[a-z]/;
        const uppercaseRegex = /[A-Z]/;
          const numberRegex = /[0-9]/;
        /

       
        if(
              this.passval.length >= 8 &&
              lowercaseRegex.test(this.passval) &&
              uppercaseRegex.test(this.passval) &&
              numberRegex.test(this.passval)){
            this.show = false;
            console.log('clicked');
            
            
        }else{
            this.show = true;
            this.validatepass = 
            `At least one lowercase letter
            At least one uppercase letter
            At least one digit 
            At least one special character`;
        }
       */

      let pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\]).{8,}$/;

       if( pattern.test(this.passval)){
            this.show = false;
            console.log('clicked');
            
            
        }else{
            this.show = true;
            this.validatepass = 
            `At least one lowercase letter
            At least one uppercase letter
            At least one digit 
            At least one special character`;
        }

    }
    refreshpage(){
        window.location.reload();
    }

}