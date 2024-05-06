import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
// apex methods
import getRecords from "@salesforce/apex/DatatableWithSingleEditableFieldCtrl.getRecords";
import updateRecords from "@salesforce/apex/DatatableWithSingleEditableFieldCtrl.updateRecords";



// updated the fieldName fields to represent object's field api names
// because the datatable component will map its columns to record fields
const columns = [
  {
    label: "Name",
    fieldName: "Name",
    type: "text",
    hideDefaultActions: "true",
    sortable: false,
    editable: true
  },
  {
    label: "Phine",
    fieldName: "Phone__c",
    type: "phone",
    hideDefaultActions: "true",
    sortable: false,
     editable: true
  },
  {
    label: "Email",
    fieldName: "Email__c",
    type: "email",
    hideDefaultActions: "true",
    sortable: false,
     editable: true
  },
  {
    label: "DOB",
    fieldName: "Date_Of_Birth__c",
    type: "date",
    hideDefaultActions: "true",
    sortable: false,
     editable: true
  }
];

export default class InlineEditingDataTable extends LightningElement {







  columns = columns;
  

  error;
  records;

  @wire(getRecords, {})
  setRecords({ error, data }) {
    if (data) {
      this.records = data;
      
    } else if (error) {
      this.error = error.body.message;
    }
  }

  // added the getter instead of just checking for if:true={records}
  // because records will have a value of object event if there is nothing to show
   get showTable() {
    return this.records !== undefined && this.records.length > 0;
  }
/*
 updateSelectedRecords(event) {
    const updatevalues = event.detail.draftValues;
    console.log('the update values' +JSON.stringify(updatevalues));
     

    updateRecords({ listOfAccounts : updatevalues })
    .then(result =>{
            console.log('the update values' +JSON.stringify(result));


            this.dispatchEvent(
                new ShowToastEvent({
                    title: "Success",
                    message: "marolix were successfully updated",
                    variant: "success"
                })
             );
    }).catch(error =>{

    }) 
 }
    */
        async updateSelectedRecords(event){

        try{

            this.draftValues=event.detail.draftValues;

            await updateRecords({ listOfAccounts: this.draftValues });

            this.draftValues=[];

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

            await refreshApex(this.accounts);

        }

    }
}