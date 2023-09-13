public with sharing class contactTriggerService {
   public static void updatingContacts(List<Contact> newObjects){
    try {
    for(Contact c: newObjects){
        
                    c.isSeniorCitizen__c = true;
                
            }
        }
        catch(Exception e){
            system.debug('Exception occured in updatingContacts method: '+e.getMessage());
        }
}
}