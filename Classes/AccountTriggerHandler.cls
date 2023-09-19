public with sharing class AccountTriggerHandler {
    
    public void onBeforeInsert(List<Account> newObjects){  
        
    }

    public void OnAfterInsert(List<Account> newObjects, Map<Id, Account> newMap){

    List<Account> accountsToActivateContacts = new List<Account>();
    List<Account> accountsToDeactivateContacts = new List<Account>();

    for(Account acc : newObjects) {
        
        if (acc.isActive__c == false) {
            accountsToDeactivateContacts.add(acc);
        }else{
            accountsToActivateContacts.add(acc);
        }

    if(!accountsToActivateContacts.isEmpty()) {
            AccountTriggerService.updateRelatedContactsStatus(accountsToActivateContacts , true);
        }

    if(!accountsToDeactivateContacts.isEmpty()) {
            AccountTriggerService.updateRelatedContactsStatus(accountsToDeactivateContacts, false);
        }
    }
    }

 

    public void onBeforeUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){
    }   

 

    public void onAfterUpdate(List<Account> oldObjects, List<Account> newObjects, Map<Id, Account> oldMap, Map<Id, Account> newMap){

       
        List<Account> accountsToActivateContacts = new List<Account>();
        List<Account> accountsToDeactivateContacts = new List<Account>();

        for(Account acc : newObjects) {
            Account oldAccount = oldMap.get(acc.Id);
            Account newAccount = newMap.get(acc.Id);

            if(oldAccount.isActive__c != newAccount.isActive__c) {
                if (newAccount.isActive__c == false) {
                    accountsToDeactivateContacts.add(newAccount);
                }else{
                    accountsToActivateContacts.add(newAccount);
                }
              
            }
        }

        if(!accountsToActivateContacts.isEmpty()) {
            AccountTriggerService.updateRelatedContactsStatus(accountsToActivateContacts , true);
        }
        if(!accountsToDeactivateContacts.isEmpty()) {
            AccountTriggerService.updateRelatedContactsStatus(accountsToDeactivateContacts, false);
        }
    }

    public void onBeforeDelete(List<Account> oldObjects, Map<Id, Account> oldMap){
    }


}