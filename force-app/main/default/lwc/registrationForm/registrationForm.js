import { LightningElement,track } from 'lwc';

export default class RegistrationForm extends LightningElement {
  
   // RegistrationForm.js
   @track username = '';
   @track password = '';
   @track passwordError = '';
   @track isRegisterButtonDisabled = true;

   handleUsernameChange(event) {
      this.username = event.target.value;
   }

   handlePasswordChange(event) {
      this.password = event.target.value;
      this.validatePassword();
   }

   validatePassword() {
      const lowercaseRegex = /[a-z]/;
      const uppercaseRegex = /[A-Z]/;
      const numberRegex = /[0-9]/;

      if (
         this.password.length >= 8 &&
         lowercaseRegex.test(this.password) &&
         uppercaseRegex.test(this.password) &&
         numberRegex.test(this.password)
      ) {
         this.passwordError = '';
         this.isRegisterButtonDisabled = false;
      } else {
         this.passwordError =
            'Password must contain at least 8 characters, including one lowercase letter<br/>, one uppercase letter, and one number.';
         this.isRegisterButtonDisabled = true;
      }
   }

   get registerButtonClass() {
      return this.isRegisterButtonDisabled ? 'disabled' : '';
   }

   registerUser() {
      // Implement your user registration logic here
      // You can use this.username and this.password to get the user input
      // For example, you can make an Apex callout to handle the registration on the server side
      console.log('User registered:', this.username);
   }
}
