import { LightningElement ,wire } from 'lwc';

import { refreshApex }  from '@salesforce/apex';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import {loadStyle} from 'lightning/platformResourceLoader';
import COLORS from '@salesforce/resourceUrl/colors';
   

import  getRecords  from '@salesforce/apex/bulkCommmentFieldUpdateClass.getRecords';
import updateRecords from '@salesforce/apex/bulkCommmentFieldUpdateClass.updateRecords';
 const columns=[
   
    {
        label: 'Comments',
        fieldName: 'Comments__c',
        editable: true,
        type: 'text'
    },
    {
       label: 'Remarks',
        fieldName: 'Remark__c',
        type: 'text',
        editable: true
    },
    {
        label: 'Step_Name',
         fieldName: 'Step_Name__c',
         type: 'text',
         editable: true
     }
];


export default class BulkCommentFieldUpdateusingDataTable extends LightningElement {
  

   
   
    columns = columns; 
     records;
     error;
     isCssLoaded = false;




           @wire(getRecords, {})
           setRecords({ error, data }) {
             if (data) {
               this.records = data;
               
             } else if (error) {
               this.error = error.body.message;
             }
           }

          

    async updateSelectedRecords(event){

        try{

            this.draftValues=event.detail.draftValues;

            await updateRecords({ recordsJson: JSON.stringify(this.draftValues) });

           
           // this.draftValues=[];
            this.dispatchEvent(new ShowToastEvent({

                title:'Success',

                variant:'success',

                message:'Records updated successfully'

            }))

            await refreshApex(this.accounts);

        }

        catch(error){

            this.dispatchEvent(new ShowToastEvent({

                title:'Error updating records',

                message: error.body.message,

                variant: 'error'

            }))

        }

    }


    renderedCallback(){ 
        if(this.isCssLoaded) return
        this.isCssLoaded = true
        loadStyle(this, COLORS).then(()=>{
            console.log("Loaded Successfully")
        }).catch(error=>{ 
            console.error("Error in loading the colors")
        })
    }

}
