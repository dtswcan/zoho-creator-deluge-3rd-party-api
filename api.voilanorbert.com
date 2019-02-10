  // my working example of a deluge postUrl to find an email on api.voilanorbert.com
  // https://www.voilanorbert.com/
  
  header = Map();
	header.put("authorization","Basic "YOUR API CODE");
	body = Map();
	fullName = FetPar.get("firstName") + " " + FetPar.get("lastName");
	if(!fullName.isEmpty())
	{
		body.put("name",fullName);
	}
	if(!FetPar.get("domain").isEmpty())
	{
		body.put("domain",FetPar.get("domain"));
	}
	if(!FetPar.get("company").isEmpty())
	{
		body.put("company",FetPar.get("company"));
	}
	body.put("webhook","https://creator.zoho.com/api/zoho_ken86/json/ocl/form/callback/record/add/authtoken=YOUR ZOHO CREATOR API CODE");
	body.put("list_id",id);
	str = "https://api.voilanorbert.com/2018-01-08/search/name";
	respx = postUrl(str,body,header,false);
	Status = respx.get("responseCode");
	resp = respx.get("responseText");
	if(Status == "200")
	{
		//do something with the responce 
	}
