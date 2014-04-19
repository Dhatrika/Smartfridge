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
	if(addItemsForm.showSuccessMessage.value == 'Yes'){
		alert('Values have been added to the smart fridge!');
	}
}
function validate(){
	if(addItemsForm.milkquantity.value == '' || !IsNumeric(addItemsForm.milkquantity.value)){
		alert('Please enter a valid quantity for milk');
		return false;
	}
	if(addItemsForm.eggsquantity.value == '' || !IsNumeric(addItemsForm.eggsquantity.value)){
		alert('Please enter a valid quantity for eggs');
		return false;
	}
	if(addItemsForm.juicequantity.value == ''|| !IsNumeric(addItemsForm.juicequantity.value)){
		alert('Please enter a valid quantity for juice');
		return false;
	}
	if(addItemsForm.veggiesquantity.value == ''|| !IsNumeric(addItemsForm.veggiesquantity.value)){
		alert('Please enter a valid quantity for veggies');
		return false;
	}
	if(parseInt(addItemsForm.milkquantity.value) + parseInt(addItemsForm.milkprevquantity.value) > parseInt(addItemsForm.milkmaxQuant.value)){
		alert('Cannot add more than max threshold for milk, quantity exceeds by ' + (parseInt(addItemsForm.milkquantity.value) + parseInt(addItemsForm.milkprevquantity.value) - parseInt(addItemsForm.milkmaxQuant.value)));
		return false;
	}
	if(parseInt(addItemsForm.eggsquantity.value) + parseInt(addItemsForm.eggsprevquantity.value) > parseInt(addItemsForm.eggsmaxQuant.value)){
		alert('Cannot add more than max threshold for eggs, quantity exceeds by ' + (parseInt(addItemsForm.eggsquantity.value) + parseInt(addItemsForm.eggsprevquantity.value) - parseInt(addItemsForm.eggsmaxQuant.value)));
		return false;
	}
	if(parseInt(addItemsForm.juicequantity.value) + parseInt(addItemsForm.juiceprevquantity.value) > parseInt(addItemsForm.juicemaxQuant.value)){
		alert('Cannot add more than max threshold for juice, quantity exceeds by ' + (parseInt(addItemsForm.juicequantity.value) + parseInt(addItemsForm.juiceprevquantity.value) - parseInt(addItemsForm.juicemaxQuant.value)));
		return false;
	}
	if(parseInt(addItemsForm.veggiesquantity.value) + parseInt(addItemsForm.veggiesprevquantity.value) > parseInt(addItemsForm.veggiesmaxQuant.value)){
		alert('Cannot add more than max threshold for veggies, quantity exceeds by ' + (parseInt(addItemsForm.veggiesquantity.value) + parseInt(addItemsForm.veggiesprevquantity.value) - parseInt(addItemsForm.veggiesmaxQuant.value)));
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

<h3>Add Items to the Smart fridge</h3>

<form name="addItemsForm" id="addItemsForm" action="saveAddItems.action" method="post">
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />

<table>
<colgroup>
</colgroup>
<tbody>

<tr>
		<td><s:property value='milk.itemName'/></td>
		<td><s:hidden name="milk.minQuant" id="milkminQuant" /></td>
		<td><s:hidden name="milk.maxQuant" id="milkmaxQuant" /></td>
		<td><s:textfield theme="simple" name="milk.newQuantity" id="milkquantity"/>&nbsp;gallon</td>
		<td>Current available quantity is <s:property value="%{milk.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="milkprevquantity" id="milkprevquantity" value="%{milk.quantity}"/></td>
		<td><s:hidden name="milk.itemId" id="milk.itemId" /></td>
</tr>
<tr>
		<td><s:property value='eggs.itemName'/></td>
		<td><s:hidden name="eggs.minQuant" id="eggsminQuant" /></td>
		<td><s:hidden name="eggs.maxQuant" id="eggsmaxQuant" /></td>
		<td><s:textfield theme="simple" name="eggs.newQuantity" id="eggsquantity" />&nbsp;dozen</td>
		<td>Current available quantity is <s:property value="%{eggs.quantity}"/>&nbsp;dozen</td>
		<td><s:hidden name="eggsprevquantity" id="eggsprevquantity" value="%{eggs.quantity}"/></td>
		<td><s:hidden name="eggs.itemId" id="eggs.itemId" /></td>
</tr>
<tr>
		<td><s:property value='juice.itemName'/></td>
		<td><s:hidden name="juice.minQuant" id="juiceminQuant" /></td>
		<td><s:hidden name="juice.maxQuant" id="juicemaxQuant" /></td>
		<td><s:textfield theme="simple" name="juice.newQuantity" id="juicequantity" />&nbsp;gallon</td>
		<td>Current available quantity is <s:property value="%{juice.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="juiceprevquantity" id="juiceprevquantity" value="%{juice.quantity}"/></td>
		<td><s:hidden name="juice.itemId" id="juice.itemId" /></td>
</tr>
<tr>
		<td><s:property value='veggies.itemName'/></td>
		<td><s:hidden theme="simple" name="veggies.minQuant" id="veggiesminQuant" /></td>
		<td><s:hidden theme="simple" name="veggies.maxQuant" id="veggiesmaxQuant" /></td>
		<td><s:textfield theme="simple" name="veggies.newQuantity" id="veggiesquantity" />&nbsp;lb</td>
		<td>Current available quantity is <s:property value="%{veggies.quantity}"/>&nbsp;lb</td>
		<td><s:hidden name="veggiesprevquantity" id="veggiesprevquantity" value="%{veggies.quantity}"/></td>
		<td><s:hidden name="veggies.itemId" id="veggies.itemId" /></td>
</tr>
</tbody>

</table>

<br>
<s:submit theme="simple" onclick="return validate();" type="submit" value="SAVE" name="SAVE" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>

</form>

</body>
</html>