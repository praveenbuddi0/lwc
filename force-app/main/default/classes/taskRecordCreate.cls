public class taskRecordCreate {

   
         @InvocableMethod
    // Method to create a Task for a specified Account
    public static list<string> createTaskForAccount(list<string> AccountId) {
        // string AccountId = '';
        list<string> taskIds = new list<string>();
         string subject = 'Email';
         Date Duedate = system.today();
        
        // Create a new Task object
       
        Task newTask = new Task();
        
        // Set Task fields
       // newTask.Subject = subject;
        newTask.ActivityDate = dueDate;
        newTask.WhatId = accountId[0]; // Specify the Account Id as the related object

        // Insert the Task record
        try {
            insert newTask;
            System.debug('Task created successfully with Id: ' + newTask.Id);
            taskIds.add(newTask.Id);
            
        } catch (Exception e) {
            System.debug('An error occurred while creating the Task: ' + e.getMessage());
        }
        return taskIds;
    }

}