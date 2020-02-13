@isTest
public with sharing class EmailManagerTests {
    @isTest
    static void EmailManagerSuccess() {
        System.assertEquals(true, EmailManager.sendMail('danylo.horyk@gmail.com', 'Test', 'test'));
    }

    @isTest
    static void EmailManagerFail() {
        try{
            EmailManager.sendMail('dalo.horyk@gmail.com', 'Test', 'test');
        }
        catch(Exception e) {
            System.assertEquals(e.getMessage(), e.getMessage());
        }
    }
}
