global class ConvertLeadsToAccountsBatchScheduler implements Schedulable{
	 global void execute(SchedulableContext sc) {
     ConvertLeadsToAccountsBatch batchJob = new ConvertLeadsToAccountsBatch();
     Database.executeBatch(batchJob, 200);
       
        /* Anonymous window code
        String cronExpression = '0 0 2 * * ?'; // every day at 2:00 AM
		System.schedule('ConvertLeadsToAccountsBatchSchedule', cronExpression, new ConvertLeadsToAccountsBatchScheduler());
		*/
    }
}