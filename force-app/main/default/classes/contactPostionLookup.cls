global class contactPostionLookup implements Database.Batchable<sObject> {
   
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        // Query Positions with Selected Stage and same starting date for each Contact
        return Database.getQueryLocator([
            SELECT Id, Contact__c, Stage__c, Starting_Date__c, Active__c
            FROM Position__c
            WHERE Stage__c = 'Selected'
            ORDER BY Contact__c, Starting_Date__c DESC
        ]);
    }

    global void execute(Database.BatchableContext BC, List<Position__c> scope) {
        Map<Id, Position__c> latestPositionsByContact = new Map<Id, Position__c>();
        
        // Identify latest Position for each Contact with multiple Positions
        for (Position__c pos : scope) {
            if (!latestPositionsByContact.containsKey(pos.Contact__c)) {
                latestPositionsByContact.put(pos.Contact__c, pos);
            } else {
                Position__c latestPos = latestPositionsByContact.get(pos.Contact__c);
                if (latestPos.Starting_Date__c == pos.Starting_Date__c) {
                    // If same starting date, make recent one active and remaining inactive
                    if (pos.Starting_Date__c > latestPos.Starting_Date__c) {
                        latestPos.Active__c = false;
                        pos.Active__c = true;
                        latestPositionsByContact.put(pos.Contact__c, pos);
                    } else {
                        pos.Active__c = false;
                    }
                }
            }
        }
        
        // Update Positions
        update scope;
    }

    global void finish(Database.BatchableContext BC) {
        // Optional: Add any post-processing logic here
    }
}