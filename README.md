# Integrate-two-Salesforce-Org
Integrate two salesforce org togther 

<h2>Child Org</h2>
<ul>
  <li>Create partner WSDL</li>
  <li>Create class to create records at the child org to be invoked from parent Org</li>
  <li>Generate WSDL for this Class</li>
</ul>

<h2>Parent Org</h2>
<ul>
  <li>Create classes to the 2 WSDL fiels that generated from the Child org</li>
  <li>Create a trigger so any event required send data to the child org</li>
  <li>Create a helper Class that Call it at the trigger to send data to the child Org</li>
  <li>Use the Class partnerSoapSForceCom(from the class created from wsdl file) to call the Login Function in it at the helper class to authenticate with the child Org</li>
  <li>after login i get the session id at a variable of type PartnerSoapSForceCom.LoginResult</li>
  <li>set this session id at a sub class called SessionHeader_element at a class called SoapSForceComSchemaClassRecivepara</li>
  <li>then we cakk the created class at the child Org from this Class SoapSForceComSchemaClassRecivepara to create the record at the child Org</li>
</ul>


