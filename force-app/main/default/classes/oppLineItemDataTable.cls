public class oppLineItemDataTable {
//public with sharing class OpplineitemsdatatableHandler {
    @AuraEnabled(cacheable=true)
    public static List<OpportunityLineItem> getopplineitems(string recId){
        List<OpportunityLineItem> opplineitems = new  List<OpportunityLineItem>();
        if(recId != '' || recId != null){
             opplineitems = [SELECT UnitPrice,Discount,Name,Quantity FROM OpportunityLineItem WHERE OpportunityId =: recId];
        }
        return opplineitems;
    }
}