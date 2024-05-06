import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';


export default class LeadRecordCreationUsingLwc extends LightningElement {
    nameval;
    phoneval;
    companyval;
    statusval;
    success;
    loading;
    show = true;
    get options(){
        return [
            { label: 'Open - Not Contacted', value: 'Open - Not Contacted' },
            { label: 'Working - Contacted', value: 'Working - Contacted' },
            { label: 'Closed - Converted', value: 'Closed - Converted' },
        ];
    }
    handlechange(event){
        const nam = event.target.name;
        if(nam == 'name'){
            this.nameval = event.target.value;
        }
        else if(nam == 'phone'){
            this.phoneval = event.target.value;
        }
        else if(nam == 'comp'){
            this.companyval = event.target.value;
        }
        else if(nam == 'status'){
            this.statusval = event.target.value;
        }
    }
    handleclick(event){
        this.show = false;
        this.loading = true;
        const fields = {
            'LastName' : this.nameval,
            'Phone' : this.phoneval,
            'Company' : this.companyval,
            'Status' : this.statusval
        };

        console.log('fields :'+JSON.stringify(fields));
        const recorddata = {apiName :'Lead', fields};
        console.log('recorddata :'+JSON.stringify(recorddata));
        createRecord(recorddata).then(Response=>{
            this.loading = false;
            this.success = true;
            //alert('Lead Created SuccessFully :'+Response.Id);
        }).catch(error=>{
            alert('error :'+error.body.message);
        });
        
    }


}