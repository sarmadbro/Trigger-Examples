trigger AccountTrigger on Account (before insert, before update, after insert, after update) {

    if(Trigger.isAfter){

        if(Trigger.isInsert){

            List<Contact> contactsToUpdate = new List<Contact>();
            for (Account acc : Trigger.new) {
            if (acc.isActive__c == false) {
                // Fetch related contacts of the account and update them
                List<Contact> relatedContacts = [SELECT Id, isActive__c FROM Contact WHERE AccountId = :acc.Id];
                for(Contact relatedContact : relatedContacts){
                    relatedContact.isActive__c = false;
                    contactsToUpdate.add(relatedContact);
                }
            }
        }
        update contactsToUpdate;

        }

        if(Trigger.isUpdate){

            List<Contact> contactsToUpdate = new List<Contact>();
            for (Account acc : Trigger.new) {
            if (acc.isActive__c == false) {
                // Fetch related contacts of the account and update them
                List<Contact> relatedContacts = [SELECT Id, isActive__c FROM Contact WHERE AccountId = :acc.Id];
                for(Contact relatedContact : relatedContacts){
                    relatedContact.isActive__c = false;
                    contactsToUpdate.add(relatedContact);
                }
            }
        }
        update contactsToUpdate;

        }

    }
}