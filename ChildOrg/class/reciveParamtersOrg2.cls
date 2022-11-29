global class reciveParamtersOrg2 {
    webservice static String createContactRecord(string firstName , string lastName) {
        Contact rec = new Contact(FirstName = firstName , LastName = lastName);
        insert rec;
        return 'success';
    }
}