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
var agree;
function showSuccess()
{
	if(consumeItemsForm.showSuccessMessage.value == 'Yes'){
		alert('Values have been consumed from the smart fridge!');
	}
}
function validate(){
	if(consumeItemsForm.milkquantity.value == '' || !IsNumeric(consumeItemsForm.milkquantity.value)){
		alert('Please enter a valid quantity for milk');
		return false;
	}
	if(consumeItemsForm.eggsquantity.value == '' || !IsNumeric(consumeItemsForm.eggsquantity.value)){
		alert('Please enter a valid quantity for eggs');
		return false;
	}
	if(consumeItemsForm.juicequantity.value == ''|| !IsNumeric(consumeItemsForm.juicequantity.value)){
		alert('Please enter a valid quantity for juice');
		return false;
	}
	if(consumeItemsForm.veggiesquantity.value == ''|| !IsNumeric(consumeItemsForm.veggiesquantity.value)){
		alert('Please enter a valid quantity for vegetables');
		return false;
	}
	if(parseInt(consumeItemsForm.milkprevquantity.value) - parseInt(consumeItemsForm.milkquantity.value) < parseInt(consumeItemsForm.milkminQuant.value)){

		if(parseInt(consumeItemsForm.milkquantity.value) != 0){
			
		agree = confirm('Threshold breached for milk. Do you want to continue?');

		if(!agree)
			return false;

		}
	}
	if(parseInt(consumeItemsForm.eggsprevquantity.value) - parseInt(consumeItemsForm.eggsquantity.value) < parseInt(consumeItemsForm.eggsminQuant.value)){

		if(parseInt(consumeItemsForm.eggsquantity.value) != 0){
			
		agree = confirm('Threshold breached for eggs. Do you want to continue?');

		if(!agree)
			return false;

		}
	}
	if(parseInt(consumeItemsForm.juiceprevquantity.value) - parseInt(consumeItemsForm.juicequantity.value) < parseInt(consumeItemsForm.juiceminQuant.value)){

		if(parseInt(consumeItemsForm.juicequantity.value) != 0){
			
		agree = confirm('Threshold breached for juice. Do you want to continue?');

		if(!agree)
			return false;

		}
	}
	if(parseInt(consumeItemsForm.veggiesprevquantity.value) - parseInt(consumeItemsForm.veggiesquantity.value) < parseInt(consumeItemsForm.veggiesminQuant.value)){

		if(parseInt(consumeItemsForm.veggiesquantity.value) != 0){
			
		agree = confirm('Threshold breached for vegetables. Do you want to continue?');

		if(!agree)
			return false;
		}
	}
	if(parseInt(consumeItemsForm.milkprevquantity.value) - parseInt(consumeItemsForm.milkquantity.value) < 0){

		alert('Cannot continue, milk quantity will be pushed to below zero level.');
		return false;
	}
	if(parseInt(consumeItemsForm.eggsprevquantity.value) - parseInt(consumeItemsForm.eggsquantity.value) < 0){

		alert('Cannot continue, eggs quantity will be pushed to below zero level.');
		return false;
	}
	if(parseInt(consumeItemsForm.juiceprevquantity.value) - parseInt(consumeItemsForm.juicequantity.value) < 0){

		alert('Cannot continue, juice quantity will be pushed to below zero level');
		return false;
	}
	if(parseInt(consumeItemsForm.veggiesprevquantity.value) - parseInt(consumeItemsForm.veggiesquantity.value) < 0){

		alert('Cannot continue, vegetables quantity will be pushed to below zero level');
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

<h3>Consume items from the Smart fridge</h3>

<form name="consumeItemsForm" id="consumeItemsForm" action="saveConsumeItems.action" method="post">
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />

<table>
<colgroup>
</colgroup>
<tbody>

<tr>
		<td><s:property value='milk.itemName'/></td>
		<td><s:hidden name="milk.minQuant" id="milkminQuant" /></td>
		<td><s:hidden name="milk.maxQuant" id="milkmaxQuant" /></td>
		<td><s:textfield theme="simple" name="milk.newQuantity" id="milkquantity"/>gallon</td>
		<td>Current available quantity is <s:property value="%{milk.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="milkprevquantity" id="milkprevquantity" value="%{milk.quantity}"/></td>
		<td><s:hidden name="milk.itemId" id="milk.itemId" /></td>
</tr>
<tr>
		<td><s:property value='eggs.itemName'/></td>
		<td><s:hidden name="eggs.minQuant" id="eggsminQuant" /></td>
		<td><s:hidden name="eggs.maxQuant" id="eggsmaxQuant" /></td>
		<td><s:textfield theme="simple" name="eggs.newQuantity" id="eggsquantity" />dozen</td>
		<td>Current available quantity is <s:property value="%{eggs.quantity}"/>&nbsp;dozen</td>
		<td><s:hidden name="eggsprevquantity" id="eggsprevquantity" value="%{eggs.quantity}"/></td>
		<td><s:hidden name="eggs.itemId" id="eggs.itemId" /></td>
</tr>
<tr>
		<td><s:property value='juice.itemName'/></td>
		<td><s:hidden name="juice.minQuant" id="juiceminQuant" /></td>
		<td><s:hidden name="juice.maxQuant" id="juicemaxQuant" /></td>
		<td><s:textfield theme="simple" name="juice.newQuantity" id="juicequantity" />gallon</td>
		<td>Current available quantity is <s:property value="%{juice.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="juiceprevquantity" id="juiceprevquantity" value="%{juice.quantity}"/></td>
		<td><s:hidden name="juice.itemId" id="juice.itemId" /></td>
</tr>
<tr>
		<td><s:property value='veggies.itemName'/></td>
		<td><s:hidden theme="simple" name="veggies.minQuant" id="veggiesminQuant" /></td>
		<td><s:hidden theme="simple" name="veggies.maxQuant" id="veggiesmaxQuant" /></td>
		<td><s:textfield theme="simple" name="veggies.newQuantity" id="veggiesquantity" />lb</td>
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