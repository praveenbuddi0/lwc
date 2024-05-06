import { LightningElement } from 'lwc';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Swal from '@salesforce/resourceUrl/Sweetalert';

import { loadScript } from 'lightning/platformResourceLoader';

export default class Popupdesign extends LightningElement {
    
    renderedCallback() {
        if (this.sweetalertInitialized) {
            return;
        }
        this.sweetalertInitialized = true;

        loadScript(this, Swal)
            .then(() => {
                this.initializeSweetalert();
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error loading SweetAlert',
                        message: error.message,
                        variant: 'error'
                    })
                );
            });
    }

    initializeSweetalert() {
        const swal = window.Sweetalert.fire;
        if (swal) {
            this.swal = swal;
        } else {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'SweetAlert is not loaded properly',
                    variant: 'error'
                })
            );
        }
    }

    openConfirmation() {
        this.swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                this.handleDelete();
            }
        });
    }

    handleDelete() {
        // Perform your deletion logic here
        // You can show a success message after deletion
        this.swal.fire({
            title: 'Deleted!',
            text: 'Your file has been deleted.',
            icon: 'success'
        });
    }
}