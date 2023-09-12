public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsForAccount(Id accountId) {
        return [SELECT Id, Name, Email FROM Contact WHERE AccountId = :accountId];
    }

    @AuraEnabled
    public static void updateContacts(List<Contact> contacts) {
        try {
            update contacts;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
