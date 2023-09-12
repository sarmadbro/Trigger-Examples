public with sharing class contactTriggerService {
   public static void updatingContacts(List<Contact> newObjects){
    for(Contact c: newObjects){
                if(c.Age__c > 60 && c.isSeniorCitizen__c == false){
                    c.isSeniorCitizen__c = true;
                }
            }
}
}