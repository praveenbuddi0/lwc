import { LightningElement, wire } from 'lwc';





import  getAccounts  from '@salesforce/apex/inlineEditAccount.getAccounts';

import { refreshApex }  from '@salesforce/apex';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import updateAccounts from '@salesforce/apex/inlineEditAccount.updateAccounts';

export default class InlineEditingAccount extends LightningElement {

    columns=[

        {

            label: 'Account Name',

            fieldName: 'Name',

            editable: true

        },

        {

            label: 'Number of Employees',

            fieldName: 'NumberOfEmployees',

            editable: true,

            type: 'number'

        },

        {

            label: 'Annual Revenue',

            fieldName: 'AnnualRevenue',

            type: 'number',

            editable: true

        }

    ]

    draftValues=[];

    @wire(getAccounts)

    accounts;

    async handleSave(event){

        try{

            this.draftValues=event.detail.draftValues;

            await updateAccounts({ listOfAccounts: this.draftValues });

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

        }

    }

}