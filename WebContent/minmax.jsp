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
	if(minmaxForm.showSuccessMessage.value == 'Yes'){
		alert('Minimum-Maximum threshold values have been saved!');
	}
}
function validate(){
	if(minmaxForm.milkminQuant.value == '' || !IsNumeric(minmaxForm.milkminQuant.value)){
		alert('Please enter a valid min quantity for milk');
		return false;
	}
	if(minmaxForm.milkmaxQuant.value == '' || !IsNumeric(minmaxForm.milkmaxQuant.value)){
		alert('Please enter a valid max quantity for milk');
		return false;
	}
	if(minmaxForm.eggsminQuant.value == ''|| !IsNumeric(minmaxForm.eggsminQuant.value)){
		alert('Please enter a valid min quantity for eggs');
		return false;
	}
	if(minmaxForm.eggsmaxQuant.value == ''|| !IsNumeric(minmaxForm.eggsmaxQuant.value)){
		alert('Please enter a valid max quantity for eggs');
		return false;
	}
	if(minmaxForm.juiceminQuant.value == ''|| !IsNumeric(minmaxForm.juiceminQuant.value)){
		alert('Please enter a valid min quantity for juice');
		return false;
	}
	if(minmaxForm.juicemaxQuant.value == ''|| !IsNumeric(minmaxForm.juicemaxQuant.value)){
		alert('Please enter a valid max quantity for juice');
		return false;
	}
	if(minmaxForm.veggiesminQuant.value == ''|| !IsNumeric(minmaxForm.veggiesminQuant.value)){
		alert('Please enter a valid min quantity for vegetables');
		return false;
	}
	if(minmaxForm.veggiesmaxQuant.value == ''|| !IsNumeric(minmaxForm.veggiesmaxQuant.value)){
		alert('Please enter a valid max quantity for vegetables');
		return false;
	}
	if(parseInt(minmaxForm.milkminQuant.value) > parseInt(minmaxForm.milkmaxQuant.value)){
		alert('Min quantity cannot be more than Maximum quantity for milk.');
		return false;
	}
	if(parseInt(minmaxForm.eggsminQuant.value) > parseInt(minmaxForm.eggsmaxQuant.value)){
		alert('Min quantity cannot be more than Maximum quantity for eggs.');
		return false;
	}
	if(parseInt(minmaxForm.juiceminQuant.value) > parseInt(minmaxForm.juicemaxQuant.value)){
		alert('Min quantity cannot be more than Maximum quantity for juice.');
		return false;
	}
	if(parseInt(minmaxForm.veggiesminQuant.value) > parseInt(minmaxForm.veggiesmaxQuant.value)){
		alert('Min quantity cannot be more than Maximum quantity for vegetables.');
		return false;
	}
	return true;
}

</script>
</head>


<body onload="javascript:showSuccess();">


<form name="homeSymbol" id="homeSymbol" action="internalLoginRedirect.action" method="post">
<s:submit theme = "simple" type="submit" value="Home" name="Home" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>
</form>

<h3>Configure minimum-maximum threshold</h3>

<form name="minmaxForm" id="minmaxForm" action="saveConfigure.action" method="post">
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />

<table id="minmax_details">
<colgroup>
</colgroup>
<tbody>
<tr>
		<td></td>
		<td>Minimum</td>
		<td>Maximum</td>
		<td></td>
		<td></td>
</tr>
<tr>
		<td><s:property value='milk.itemName'/></td>
		<td><s:textfield theme="simple" name="milk.minQuant" id="milkminQuant" />gallon</td>
		<td><s:textfield theme="simple" name="milk.maxQuant" id="milkmaxQuant" />gallon</td>
		<td><s:hidden name="milk.quantity" id="milk.quantity" /></td>
		<td><s:hidden name="milk.itemId" id="milk.itemId" /></td>
</tr>
<tr>
		<td><s:property value='eggs.itemName'/></td>
		<td><s:textfield theme="simple" name="eggs.minQuant" id="eggsminQuant" />dozen</td>
		<td><s:textfield theme="simple" name="eggs.maxQuant" id="eggsmaxQuant" />dozen</td>
		<td><s:hidden name="eggs.quantity" id="eggs.quantity" /></td>
		<td><s:hidden name="eggs.itemId" id="eggs.itemId" /></td>
</tr>
<tr>
		<td><s:property value='juice.itemName'/></td>
		<td><s:textfield theme="simple" name="juice.minQuant" id="juiceminQuant" />gallon</td>
		<td><s:textfield theme="simple" name="juice.maxQuant" id="juicemaxQuant" />gallon</td>
		<td><s:hidden name="juice.quantity" id="juice.quantity" /></td>
		<td><s:hidden name="juice.itemId" id="juice.itemId" /></td>
</tr>
<tr>
		<td><s:property value='veggies.itemName'/></td>
		<td><s:textfield theme="simple" name="veggies.minQuant" id="veggiesminQuant" />lb</td>
		<td><s:textfield theme="simple" name="veggies.maxQuant" id="veggiesmaxQuant" />lb</td>
		<td><s:hidden name="veggies.quantity" id="veggies.quantity" /></td>
		<td><s:hidden name="veggies.itemId" id="veggies.itemId" /></td>
</tr>
</tbody>

</table>

<br>
<s:submit theme="simple" onclick="return validate();" type="submit" value="SAVE" name="SAVE" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>

</form>

</body>
</html>