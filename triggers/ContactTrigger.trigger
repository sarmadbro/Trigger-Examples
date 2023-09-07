trigger ContactTrigger on Contact (before insert, before update, after insert, after update) {

    if(Trigger.isBefore){

        if(Trigger.isInsert){
            for(Contact c: Trigger.new){
                if(c.Age__c > 60 && c.isSeniorCitizen__c == false){
                    c.isSeniorCitizen__c = true;
                }
            }
        }

        if(Trigger.isUpdate){
            for(Contact c: Trigger.new){
                if(c.Age__c > 60 && c.isSeniorCitizen__c == false){
                   c.isSeniorCitizen__c = true;
                }
            }
        }
    }
}