public with sharing class contactTriggerHandler {
      
    public void onBeforeInsert(List<Contact> newObjects){  
        contactTriggerService.updatingContacts(newObjects);
    }

    public void OnAfterInsert(List<Contact> newObjects, Map<Id, Contact> newMap){
        
    }

 

    public void onBeforeUpdate(List<Contact> oldObjects, List<Contact> newObjects, Map<Id, Contact> oldMap, Map<Id, Contact> newMap){
        contactTriggerService.updatingContacts(newObjects);
    }   

 

    public void onAfterUpdate(List<Contact> oldObjects, List<Contact> newObjects, Map<Id, Contact> oldMap, Map<Id, Contact> newMap){
        
    }

    public void onBeforeDelete(List<Contact> oldObjects, Map<Id, Contact> oldMap){
    }

}