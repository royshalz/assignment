global class ConvertLeadsToAccountsBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC) {
    return Database.getQueryLocator('SELECT Id, FirstName, LastName, Company, Phone, Email FROM Lead Limit 10');
    }

    global void execute(Database.BatchableContext BC, List<Lead> scope) {
       System.debug('=== Start of execute() ===');
    
    	List<Account> accountsToInsert = new List<Account>();
    	for (Lead lead : scope) {
       		 Account newAccount = new Account(Name = lead.Company,Phone = lead.Phone);
        	accountsToInsert.add(newAccount);
   		}
    
    	if (!accountsToInsert.isEmpty()) {
            system.debug('acc to insert======>'+accountsToInsert);
        	insert accountsToInsert;
    	}
    	System.debug('Converted Leads to Account ' + scope);

    }

    global void finish(Database.BatchableContext BC) {
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddress= new String[]{'royshalz143@gmail.com'};
		mail.setToAddresses (toAddress);
		mail.setSubject('Batch Job Completed');
		mail.setPlainTextBody('Hey, The batch job that you started is successfully completed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }

   /* global void execute(SchedulableContext sc) {
        System.debug('=== Start of Schedulable execute() ===');
Anonymous window code-
        ConvertLeadsToAccountsBatch cltab = new ConvertLeadsToAccountsBatch();
        Database.executeBatch(cltab, 200);
    } */
}