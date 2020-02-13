public class lookupField {
    @AuraEnabled
    public static List<sObject> lookupField(String ObjectName, String search){
        String SearchText = '%' + search + '%';
        String sQuery = 'SELECT Id, Name FROM ' + ObjectName + ' WHERE Name LIKE :SearchText LIMIT 5';
        List<sObject> listObjects = Database.query(sQuery);
        return listObjects;
    }

    @AuraEnabled
    public static sObject setName(String id, String ObjectName){
        String sQuery = 'SELECT Id, Name FROM ' + ObjectName + ' WHERE Id =: id LIMIT 1';
        sObject obj = Database.query(sQuery);
        return obj;
    }
}
