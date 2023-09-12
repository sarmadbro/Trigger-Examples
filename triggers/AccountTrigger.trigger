trigger AccountTrigger on Account (before insert, before update, after insert, after update) {



    //Trigger Control
    Trigger_Control_mdt__mdt objTrgActive = [Select Is_Active__c from Trigger_Control_mdt__mdt where DeveloperName = 'AccountTrg'];
    if(!objTrgActive.Is_Active__c ) return ;

 

    // instantiating an instance of AccountTriggerHandler class.
    AccountTriggerHandler handler = new AccountTriggerHandler();

    // Before Insert
    if(Trigger.isInsert && Trigger.isBefore)
    {
        handler.OnBeforeInsert(Trigger.new);
    }

    // After Insert
    else if(Trigger.isInsert && Trigger.isAfter)
    {
        handler.OnAfterInsert(Trigger.new, Trigger.newMap);
    }

    // Before Update
    else if(Trigger.isUpdate && Trigger.isBefore)
    {
        handler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
    }

    // After Update
    else if(Trigger.isUpdate && Trigger.isAfter)
    {
        handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
    }


}