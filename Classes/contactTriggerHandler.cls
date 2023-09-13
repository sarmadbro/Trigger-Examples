public with sharing class contactTriggerHandler {
      
    public void onBeforeInsert(List<Contact> newObjects){  

        List<Contact> contactsToUpdate = new List<Contact>();

    for(Contact con : newObjects) {
        
        if(con.Age__c > 60 && con.isSeniorCitizen__c == false) {
            contactsToUpdate.add(con);
        }
    }

    if(!contactsToUpdate.isEmpty()) {
        contactTriggerService.updatingContacts(contactsToUpdate);
    }
    }

    public void OnAfterInsert(List<Contact> newObjects, Map<Id, Contact> newMap){
        
    }

 

    public void onBeforeUpdate(List<Contact> oldObjects, List<Contact> newObjects, Map<Id, Contact> oldMap, Map<Id, Contact> newMap){

        List<Contact> contactsToUpdate = new List<Contact>();

        for(Contact c : newObjects) {
            Contact oldContact = oldMap.get(c.Id);
            Contact newContact = newMap.get(c.Id);

            if(oldContact.Age__c != newContact.Age__c && newContact.Age__c > 60 && newContact.isSeniorCitizen__c == false) {
                contactsToUpdate.add(newContact);
            }
        }
       
        if(!contactsToUpdate.isEmpty()) {
            contactTriggerService.updatingContacts(contactsToUpdate);
        }
    }   

 

    public void onAfterUpdate(List<Contact> oldObjects, List<Contact> newObjects, Map<Id, Contact> oldMap, Map<Id, Contact> newMap){
        
    }

    public void onBeforeDelete(List<Contact> oldObjects, Map<Id, Contact> oldMap){
    }

}