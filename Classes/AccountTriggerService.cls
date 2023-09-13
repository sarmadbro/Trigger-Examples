public with sharing class AccountTriggerService {

   public static void updatingRelatedContacts(List<Account> newObjects, Map<Id, Account> newMap){
    try {
    List<Contact> contactsToUpdate = new List<Contact>();
    Set<Id> accountIds = new Set<Id>();

        for (Account acc : newObjects)  {
                accountIds.add(acc.Id);
        }
        
        for(Contact relatedContact : [SELECT Id, isActive__c FROM Contact WHERE AccountId = :accountIds limit 1000]){
            relatedContact.isActive__c = false;
            contactsToUpdate.add(relatedContact);
        }

        if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
        }
    }
    catch (Exception e) {
        System.debug('Exception occurred while updating related contacts: ' + e.getMessage());
    }
}
}