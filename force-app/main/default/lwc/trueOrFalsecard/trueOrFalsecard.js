import { LightningElement } from 'lwc';
export default class TrueOrFalsecard extends LightningElement {
  varlab = 'show';
  showme = true ;
  

  handleClick(event){
      let labelvar = event.target.label;
      if(labelvar === 'show'){
          this.varlab = 'Hide';
          console.log('Hide'+this.varlab);
          this.showme = false;

      } else if(labelvar === 'Hide'){
          this.varlab = 'show';
          console.log('show'+this.varlab);
          this.showme = true;
      }

  }


}