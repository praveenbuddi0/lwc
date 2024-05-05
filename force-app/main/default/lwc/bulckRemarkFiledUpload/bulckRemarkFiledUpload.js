import { LightningElement, track, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';



import insertRemarks from '@salesforce/apex/RemarkBulkUploaderController.insertRemarks';

export default class BulckRemarkFiledUpload extends LightningElement {



    // remarkBulkUploader.js




    @track csvData;

    handleFileUpload(event) {
        const file = event.target.files[0];
        const reader = new FileReader();

        reader.onload = () => {
            this.csvData = reader.result;
        };

        reader.readAsText(file);
    }

    insertRemarks() {
        // Parse CSV data and prepare for insertion
        const parsedData = this.parseCSVData(this.csvData);

        // Call the Apex method
        insertRemarks({ remarks: parsedData })
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

    parseCSVData(csvData) {
        // Implement your CSV parsing logic here
        // Return an array of remarks
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
            const remark = columns[1]; // Adjust index based on your CSV structure

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
