public with sharing class AccountTriggerHandler {
    
   
    public void onBeforeInsert(List<Account> newObjects){  
        
    }

    public void OnAfterInsert(List<Account> newObjects, Map<Id, Account> newMap){

    List<Account> accountsToUpdate = new List<Account>();

    for(Account acc : newObjects) {
        
        if(acc.isActive__c == false) {
            accountsToUpdate.add(acc);
        }
    }

    if(!accountsToUpdate.isEmpty()) {
        AccountTriggerService.updatingRelatedContacts(accountsToUpdate, newMap);
    }
    }

 

    public void onBeforeUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){
    }   

 

    public void onAfterUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){

        List<Account> accountsToUpdate = new List<Account>();

        for(Account acc : newObjects) {
            Account oldAccount = oldMap.get(acc.Id);
            Account newAccount = newMap.get(acc.Id);

            if(oldAccount.isActive__c != newAccount.isActive__c && newAccount.isActive__c == false) {
                accountsToUpdate.add(newAccount);
            }
        }

        if(!accountsToUpdate.isEmpty()) {
            AccountTriggerService.updatingRelatedContacts(accountsToUpdate, newMap);
        }
    }

    public void onBeforeDelete(List<Account> oldObjects, Map<Id, Account> oldMap){
    }


}