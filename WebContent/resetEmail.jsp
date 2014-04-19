<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Smartfridge</title>

<LINK media="screen" href="common.css" type="text/css" rel="STYLESHEET"></LINK>

<script language="javascript" type="text/javascript" src="configure.js"></script>
<script>

function showSuccess()
{
	if(setEmailForm.showSuccessMessage.value == 'Yes'){
		alert('Email Address has been reset!!');
	}
}

function validate(){
	if(setEmailForm.oldAddress.value == ''){
		alert('Please enter correct current Email Address');
				return false;
	}
	if(setEmailForm.newEmailAddress.value == ''){
		alert('Please enter a valid new email address');
		return false;
	}
	if(setEmailForm.oldEmailAddress.value != setEmailForm.oldAddress.value){
		alert('Please enter correct current Email Address');
				return false;
	}
	var newEmailAddr = setEmailForm.newEmailAddress.value;
	if(!(newEmailAddr.indexOf('@') >= 0)) {
		alert('Please enter a valid new email address in the format i.e. xyx@hotmail.com or xyz@email.com');
		return false;
	}
	
	return true;
}

</script>
</head>


<body onload="javascript:showSuccess();">


<form name="homeSymbol" id="homeSymbol" action="internalLoginRedirect.action" method="post">
<s:submit theme="simple" type="submit" value="Home" name="Home" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>
</form>

<h3>Reset Email Address</h3>

<form id="setEmailForm" action="saveEmail.action" method="post">
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />
<s:hidden name="oldEmailAddress" id="oldEmailAddress" />

<table>
<tr><td></td><td>Old Email Address&nbsp;<s:textfield name="oldAddress" id="oldAddress"/></td></tr>
<tr><td></td><td>New Email Address&nbsp;<s:textfield name="newEmailAddress" id="newEmailAddress" value=""/></td></tr>  
<s:submit onclick="return validate();" type="submit" value="SAVE" name="SAVE" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>

</table>
</form>

</body>
</html>