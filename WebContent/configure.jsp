<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Smart fridge</title>
<LINK media="screen" href="common.css" type="text/css" rel="STYLESHEET"></LINK>
</head>
<script>
function setMinMax(){
	configureForm.configureValue.value = 'minmax';
	return true;
}
function addItems(){
	configureForm.configureValue.value = 'additems';
	return true;
}
function consumeItems(){
	configureForm.configureValue.value = 'consumeitems';
	return true;
}
function resetPassword(){
	configureForm.configureValue.value = 'resetpassword';
	return true;
}
function configureEmail(){
	configureForm.configureValue.value = 'configuremail';
	return true;
}
function shoppingList(){
	configureForm.configureValue.value = 'shoppinglist';
	return true;
}
function showItemStatus(){
	configureForm.configureValue.value = 'statusitems';
	return true;
}
function logOff(){
	configureForm.configureValue.value = 'logoff';
	return true;
}
</script>
<body>

<form id="configureForm" action="configure.action" method="post">

<s:hidden name="configureValue" id="configureValue"></s:hidden>

<s:submit theme="simple" onclick="return setMinMax();" type="submit" value="Configure Minimum-Maximum" name="MINMAX" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return addItems();" type="submit" value="Add Items To Fridge" name="ADDITEMS" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return consumeItems();" type="submit" value="Consume Items From Fridge" name="CONSUMEITEMS" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return resetPassword();" type="submit" value="Reset Password" name="RESETPASSWORD" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return configureEmail();" type="submit" value="Configure Email Address" name="CONFIGUREEMAIL" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return shoppingList();" type="submit" value="Generate Shopping List" name="SHOPPINGLIST" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return showItemStatus();" type="submit" value="Show Item Status" name="ITEMSTATUS" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>
<br><br>
<s:submit theme="simple" onclick="return logOff();" type="submit" value="Sign Out!" name="SIGNOUT" cssStyle="align:left;color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px;"></s:submit>

</form>

</body>
</html>