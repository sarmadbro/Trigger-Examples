public with sharing class AccountTriggerService {

   public static void updatingRelatedContacts(List<Account> newObjects, Map<Id, Account> newMap){
    List<Contact> contactsToUpdate = new List<Contact>();
    Set<Id> accountIds = new Set<Id>();

        for (Account acc : newObjects)  {
            if (acc.isActive__c == false) {
                accountIds.add(acc.Id);
            }
        }
        
        // Fetch related contacts of the accounts and update them
        List<Contact> relatedContacts = [SELECT Id, isActive__c FROM Contact WHERE AccountId = :accountIds limit 1000];

        for(Contact relatedContact : relatedContacts){
            relatedContact.isActive__c = false;
            contactsToUpdate.add(relatedContact);
        }

        if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
        }
    }
}