import { LightningElement, track, wire } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import insertComments from '@salesforce/apex/CommentBulkUploaderController.insertComments';



export default class BulckCommentFieldUploader extends LightningElement {

// commentBulkUploader.js





    @track csvData;

    handleFileUpload(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = () => {
            this.csvData = reader.result;
        };

        reader.readAsText(file);
    }



/*
    insertComments() {
        // Parse CSV data and prepare for insertion
        const parsedData = this.parseCSVData(this.csvData);

        // Create an array to hold records
        const records = parsedData.map(comment => {
            return {
                apiName: 'Pre_Construction_Step__c',
                fields: {
                    Comments__c: comment
                }
            };
        });
     */

        insertComments() {
            // Parse CSV data and prepare for insertion
            const parsedData = this.parseCSVData(this.csvData);
    
            // Call the Apex method
            insertComments({ comments: parsedData })
                .then(() => {
                    // Handle success
                    this.showSuccessToast('Remarks inserted successfully');
                })
                .catch(error => {
                    // Handle error
                    this.showErrorToast('Error inserting remarks', error.body.message);
                });
        }




        /*

        // Insert records using uiRecordApi
        createRecord({ apiName: 'Pre_Construction_Step__c', fields: records })
            .then(() => {
                // Handle success
                this.showSuccessToast('Comments inserted successfully');
            })
            .catch(error => {
                // Handle error
                this.showErrorToast('Error inserting comments', error.body.message);
            });
    }
    */
  /*
    parseCSVData(csvData) {
        // Implement your CSV parsing logic here
        // Return an array of comments
        // Example: return csvData.split('\n').map(line => line.split(',')[1]);
    }
    */
    parseCSVData(csvData) {
        // Implement your CSV parsing logic here
        const rows = csvData.split('\n');
        const remarks = [];

        for (let i = 1; i < rows.length; i++) {
            // Skip header row assuming the first row is a header
            const columns = rows[i].split(',');
            const remark = columns[0]; // Adjust index based on your CSV structure

            if (remark) {
                remarks.push(remark);
            }
        }

        return remarks;
    }


    showSuccessToast(message) {
        const event = new ShowToastEvent({
            title: 'Success',
            message: message,
            variant: 'success'
        });
        this.dispatchEvent(event);
    }

    showErrorToast(title, message) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: 'error'
        });
        this.dispatchEvent(event);
    }
}
