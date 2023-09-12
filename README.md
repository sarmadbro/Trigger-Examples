# Salesforce Apex Triggers

This repository contains Apex triggers for Salesforce to automate certain data processing tasks. These triggers are designed to be used in Salesforce environments where specific actions need to be taken when records are inserted or updated.


## Triggers

### 1. `ContactTrigger`

The `ContactTrigger` is an Apex trigger for the Contact object in Salesforce. It runs in both `before insert` and `before update` contexts and performs the following task:

- If the Contact's `Age__c` field is greater than 60 and the `isSeniorCitizen__c` field is `false`, it sets `isSeniorCitizen__c` to `true`.

### 2. `AccountTrigger`

The `AccountTrigger` is an Apex trigger for the Account object in Salesforce. It runs in both `after insert` and `after update` contexts and performs the following task:

- If an Account's `isActive__c` field is set to `false`, it fetches related Contact records and updates their `isActive__c` field to `false`.

