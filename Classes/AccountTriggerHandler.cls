public with sharing class AccountTriggerHandler {
    
   
    public void onBeforeInsert(List<Account> newObjects){  
        
    }

    public void OnAfterInsert(List<Account> newObjects, Map<Id, Account> newMap){
        AccountTriggerService.updatingRelatedContacts(newObjects,newMap);
    }

 

    public void onBeforeUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){
    }   

 

    public void onAfterUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){
        AccountTriggerService.updatingRelatedContacts(newObjects,newMap);
    }

    public void onBeforeDelete(List<Account> oldObjects, Map<Id, Account> oldMap){
    }


}