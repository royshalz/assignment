public class Assessment {
    @future
    public static void AccountToCreate(List<String> nameVal,List<String> phone) {
        List<Account> accountsToInsert = new List<Account>();
        List<Contact> contactsToInsert = new List<Contact>();

        for (Integer i = 0; i < nameVal.size(); i++) {
            Account acc = new Account(Name = nameVal[i]);
            accountsToInsert.add(acc);
            System.debug('acc======>'+acc);
        }

 		insert accountsToInsert;
        List<Account> insertedAccounts = [SELECT Id FROM Account WHERE Name IN :nameVal];
        System.debug('=======>'+insertedAccounts);
        
        for (Integer i = 0; i < insertedAccounts.size(); i++) {
            Contact con = new Contact(LastName=nameVal[i],Phone=phone[i] ,AccountId = insertedAccounts[i].Id);
            contactsToInsert.add(con);
            System.debug('con======>'+con);

        }
        
       insert contactsToInsert;       
    }
}

/*Anonymous window code
  //List<String> names =new List<String>{'Aashna Sharma','Bhoomika','Divanshi Mahajan','Harleen Kaur Chadha', 'Jashandeep Singla','Lagnesh Thakur','Mayank Aggarwal','Neeraj Shridhar','Nidhi','Pranav Sudhakar','Rishabh Singhal','Sana Gupta','Sanchit Arora','Shalini Roy','Siddhant Mishra','Sonali Chawla','Srishty Rawat','Vidhan Tiwari'};
//List<String> phoneNumber =new List<String>{'1234567890','1234567891','1234567892','1234567893','1234567894','1234567895','1234567896','1234567897','1234567898','1234567899','1234567801','1234567802','1234567803','1234567804','1234567805','1234567806','1234567807','1234567808'};
// Assessment.AccountToCreate(names,phoneNumber);

//AccountContactQueueable queue1 = new AccountContactQueueable(names,phoneNumber);
//System.enqueueJob(queue1);
*/