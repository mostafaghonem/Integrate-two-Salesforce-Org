public class SendContactToExternalSys {
    public void sendContact(id id1){
        sendDataToSalesforceChildSystem(id1);
    }

    @future(callout=true)
    public static void sendDataToSalesforceChildSystem(id id1){
        Contact con = [Select FirstName , LastName from Contact where id = :id1];
        partnerSoapSforceCom.soap myPartnerSoap = new partnerSoapSforceCom.soap();
        partnerSoapSforceCom.LoginResult partnerLoginResult =  myPartnerSoap.login('UserName' , 'passwordSecurityToken');
        //so Now this result has the session ID
        //we need to set this session id at the Header
        //Call our webservice of the child class
        system.debug('Generated Session ID :' + partnerLoginResult.sessionId);
        string sessionId = partnerLoginResult.sessionId;
        
        soapSforceComSchemasClassRecivepara.SessionHeader_element webServiceSessionHeader = new soapSforceComSchemasClassRecivepara.SessionHeader_element();
        webServiceSessionHeader.sessionId = sessionId;
        soapSforceComSchemasClassRecivepara.reciveParamtersOrg2 objA = new soapSforceComSchemasClassRecivepara.reciveParamtersOrg2();
        objA.SessionHeader = webServiceSessionHeader;
        string status = objA.createContactRecord(con.FirstName , con.LastName);
        System.debug('status:'+status);

    }
}