
public with sharing class ExampleAccountService {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> findAccountsByName(String namePart) {
        String pattern = '%' + String.escapeSingleQuotes(namePart) + '%';

        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            WHERE Name LIKE :pattern
            LIMIT 50
        ];
    }

    @AuraEnabled(cacheable=true)
    public static String hello(String who) {
        if (String.isBlank(who)) {
            return 'Hello Salesforce!';
        }
        return 'Hello ' + who + '!';
    }
}
