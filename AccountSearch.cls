
public with sharing class AccountSearch {
    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String nameInput) {
      
        String soql = 'SELECT Id, Name FROM Account WHERE Name LIKE \'%' + nameInput + '%\'';
        return Database.query(soql);
    }
}
