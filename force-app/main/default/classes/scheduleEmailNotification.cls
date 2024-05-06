global class scheduleEmailNotification implements Schedulable{
  
    global void execute(SchedulableContext ctx) {
        // Instantiate your Apex class containing email notification logic
        EmailNotificationClass notificationClass = new EmailNotificationClass();

        // Execute email notification logic
        notificationClass.sendEmailNotifications();
    }
}