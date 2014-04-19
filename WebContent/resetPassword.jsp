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
	if(setPasswordForm.showSuccessMessage.value == 'Yes'){
		alert('Password has been reset!!');
	}
}

function validate(){
	if(setPasswordForm.oldConfirmPassword.value == ''){
		alert('Please enter the correct current password');
				return false;
	}
	if(setPasswordForm.newPassword.value == ''){
		alert('Please enter a valid new password');
				return false;
	}
	if(setPasswordForm.confirmPassword.value == ''){
		alert('Please confirm the new password');
				return false;
	}
	if(setPasswordForm.oldPassword.value != setPasswordForm.oldConfirmPassword.value){
		alert('Please enter the correct current password');
				return false;
	}
	if(setPasswordForm.newPassword.value !=  setPasswordForm.confirmPassword.value){
		alert('New password confirmation does not match with the password!');
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

<h3>Reset Password</h3>

<form id="setPasswordForm" action="savePassword.action" method="post">
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />
<s:hidden name="oldPassword" id="oldPassword" />

<table>
<tr><td></td><td>Old Password&nbsp;<s:password name="oldConfirmPassword" id="oldConfirmPassword"/></td></tr>
<tr><td></td><td>New Password&nbsp;<s:password name="newPassword" id="newPassword"/></td></tr> 
<tr><td></td><td>Confirm Password&nbsp;<s:password name="confirmPassword" id="confirmPassword"/></td></tr> 
<s:submit onclick="return validate();" type="submit" value="SAVE" name="SAVE" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>

</table>
</form>

</body>
</html>