public class AccountContactQueueable implements Queueable{
    List<String> names;
    List<String> phoneNumber;
    
    public AccountContactQueueable(List<String> names, List<String> phoneNumber) {
        this.names = names;
        this.phoneNumber = phoneNumber;
    }
    
    public void execute(QueueableContext context) {
        Assessment.AccountToCreate(names, phoneNumber);
    }

    
    
    //List<String> names =new List<String>{'Aashna Sharma','Bhoomika','Divanshi Mahajan','Harleen Kaur Chadha', 'Jashandeep Singla','Lagnesh Thakur','Mayank Aggarwal','Neeraj Shridhar','Nidhi','Pranav Sudhakar','Rishabh Singhal','Sana Gupta','Sanchit Arora','Shalini Roy','Siddhant Mishra','Sonali Chawla','Srishty Rawat','Vidhan Tiwari'};
//List<String> phoneNumber =new List<String>{'1234567890','1234567891','1234567892','1234567893','1234567894','1234567895','1234567896','1234567897','1234567898','1234567899','1234567801','1234567802','1234567803','1234567804','1234567805','1234567806','1234567807','1234567808'};
// Assessment.AccountToCreate(names,phoneNumber);

//AccountContactQueueable queue1 = new AccountContactQueueable(names,phoneNumber);
//System.enqueueJob(queue1);
}