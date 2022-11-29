trigger ContactTrigger on Contact (after insert , after update) {
    Contact createdRec = Trigger.new[0];

    if(createdRec.FirstName !=null || createdRec.LastName !=null){
        SendContactToExternalSys c = new SendContactToExternalSys();
        system.debug('Call Send Contact method');
        c.sendContact(createdRec.id);
    }
}