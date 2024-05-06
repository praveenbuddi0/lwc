public class EmailNotificationClass {

    public void sendEmailNotifications() {
        // Query tasks with due dates within the next 3 days
        List<Task> upcomingTasks = [SELECT Id, Subject, ActivityDate, Owner.Email 
                                    FROM Task 
                                    WHERE ActivityDate <= :Date.today().addDays(3)];
       /*
        // Query pending approvals
        List<Approval> pendingApprovals = [SELECT Id, Subject, Status, TargetObjectId, Owner.Email 
                                           FROM Approval 
                                           WHERE Status = 'Pending'];
          */

        // Construct and send email notifications for upcoming tasks
        for (Task task : upcomingTasks) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{task.Owner.Email});
            email.setSubject('Upcoming Task Reminder: ' + task.Subject);
            email.setPlainTextBody('This is a reminder for the upcoming task: ' + task.Subject);
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
        }
        
        /*

        // Construct and send email notifications for pending approvals
        for (Approval approval : pendingApprovals) {
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(new List<String>{approval.Owner.Email});
            email.setSubject('Pending Approval Reminder: ' + approval.Subject);
            email.setPlainTextBody('This is a reminder for the pending approval: ' + approval.Subject);
            Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{email});
        }
       */
    }
}