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
	if(shoppingListForm.showSuccessMessage.value == 'Print'){
		alert('Shopping List has been Printed!');
		return;
	}
	if(shoppingListForm.showSuccessMessage.value == 'Order'){
		alert('Shopping List has been Ordered Online!');
		return;
	}
}
function validatePrint(){

	shoppingListForm.orderType.value = 'Print';
	
	if(shoppingListForm.milkquantity.value == '' || !IsNumeric(shoppingListForm.milkquantity.value)){
		alert('Please enter a valid quantity for milk');
		return false;
	}
	if(shoppingListForm.eggsquantity.value == '' || !IsNumeric(shoppingListForm.eggsquantity.value)){
		alert('Please enter a valid quantity for eggs');
		return false;
	}
	if(shoppingListForm.juicequantity.value == ''|| !IsNumeric(shoppingListForm.juicequantity.value)){
		alert('Please enter a valid quantity for juice');
		return false;
	}
	if(shoppingListForm.veggiesquantity.value == ''|| !IsNumeric(shoppingListForm.veggiesquantity.value)){
		alert('Please enter a valid quantity for veggies');
		return false;
	}
	if(parseInt(shoppingListForm.milkquantity.value) > parseInt(shoppingListForm.milkmaxorderquantity.value)){
		alert('Cannot order more than max threshold for milk, quantity exceeds by ' + (parseInt(shoppingListForm.milkquantity.value) - parseInt(shoppingListForm.milkmaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.eggsquantity.value) > parseInt(shoppingListForm.eggsmaxorderquantity.value)){
		alert('Cannot order more than max threshold for eggs, quantity exceeds by ' + (parseInt(shoppingListForm.eggsquantity.value) - parseInt(shoppingListForm.eggsmaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.juicequantity.value) > parseInt(shoppingListForm.juicemaxorderquantity.value)){
		alert('Cannot order more than max threshold for juice, quantity exceeds by ' + (parseInt(shoppingListForm.juicequantity.value) - parseInt(shoppingListForm.juicemaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.veggiesquantity.value) > parseInt(shoppingListForm.veggiesmaxorderquantity.value)){
		alert('Cannot order more than max threshold for veggies, quantity exceeds by ' + (parseInt(shoppingListForm.veggiesquantity.value) - parseInt(shoppingListForm.veggiesmaxorderquantity.value)));
		return false;
	}
	
	return true;
}

function validateOrder(){

	shoppingListForm.orderType.value = 'Order';
	
	if(shoppingListForm.milkquantity.value == '' || !IsNumeric(shoppingListForm.milkquantity.value)){
		alert('Please enter a valid quantity for milk');
		return false;
	}
	if(shoppingListForm.eggsquantity.value == '' || !IsNumeric(shoppingListForm.eggsquantity.value)){
		alert('Please enter a valid quantity for eggs');
		return false;
	}
	if(shoppingListForm.juicequantity.value == ''|| !IsNumeric(shoppingListForm.juicequantity.value)){
		alert('Please enter a valid quantity for juice');
		return false;
	}
	if(shoppingListForm.veggiesquantity.value == ''|| !IsNumeric(shoppingListForm.veggiesquantity.value)){
		alert('Please enter a valid quantity for veggies');
		return false;
	}
	if(parseInt(shoppingListForm.milkquantity.value) > parseInt(shoppingListForm.milkmaxorderquantity.value)){
		alert('Cannot order more than max threshold for milk, quantity exceeds by ' + (parseInt(shoppingListForm.milkquantity.value) - parseInt(shoppingListForm.milkmaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.eggsquantity.value) > parseInt(shoppingListForm.eggsmaxorderquantity.value)){
		alert('Cannot order more than max threshold for eggs, quantity exceeds by ' + (parseInt(shoppingListForm.eggsquantity.value) - parseInt(shoppingListForm.eggsmaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.juicequantity.value) > parseInt(shoppingListForm.juicemaxorderquantity.value)){
		alert('Cannot order more than max threshold for juice, quantity exceeds by ' + (parseInt(shoppingListForm.juicequantity.value) - parseInt(shoppingListForm.juicemaxorderquantity.value)));
		return false;
	}
	if(parseInt(shoppingListForm.veggiesquantity.value) > parseInt(shoppingListForm.veggiesmaxorderquantity.value)){
		alert('Cannot order more than max threshold for veggies, quantity exceeds by ' + (parseInt(shoppingListForm.veggiesquantity.value) - parseInt(shoppingListForm.veggiesmaxorderquantity.value)));
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

<h3>Shopping List</h3>

<form name="shoppingListForm" id="shoppingListForm" action="sendShoppingList.action" method="post">
<s:hidden name="orderType" id="orderType" />
<s:hidden name="showSuccessMessage" id="showSuccessMessage" />

<table>
<colgroup>
</colgroup>
<tbody>

<tr>
		<td><s:property value='milk.itemName'/></td>
		<td><s:hidden name="milk.minQuant" id="milkminQuant" /></td>
		<td><s:hidden name="milk.maxQuant" id="milkmaxQuant" /></td>
		<td><s:hidden name="milk.itemName" id="milk.itemName" /></td>
		<td><s:textfield theme="simple" name="milk.newQuantity" id="milkquantity"/>&nbsp;gallon</td>
		<td>Current available quantity is <s:property value="%{milk.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="milkmaxorderquantity" id="milkmaxorderquantity" value="%{milk.newQuantity}"/></td>
		<td><s:hidden name="milk.itemId" id="milk.itemId" /></td>
</tr>
<tr>
		<td><s:property value='eggs.itemName'/></td>
		<td><s:hidden name="eggs.minQuant" id="eggsminQuant" /></td>
		<td><s:hidden name="eggs.maxQuant" id="eggsmaxQuant" /></td>
		<td><s:hidden name="eggs.itemName" id="eggs.itemName" /></td>
		<td><s:textfield theme="simple" name="eggs.newQuantity" id="eggsquantity" />&nbsp;dozen</td>
		<td>Current available quantity is <s:property value="%{eggs.quantity}"/>&nbsp;dozen</td>
		<td><s:hidden name="eggsmaxorderquantity" id="eggsmaxorderquantity" value="%{eggs.newQuantity}"/></td>
		<td><s:hidden name="eggs.itemId" id="eggs.itemId" /></td>
</tr>
<tr>
		<td><s:property value='juice.itemName'/></td>
		<td><s:hidden name="juice.minQuant" id="juiceminQuant" /></td>
		<td><s:hidden name="juice.maxQuant" id="juicemaxQuant" /></td>
		<td><s:hidden name="juice.itemName" id="juice.itemName" /></td>
		<td><s:textfield theme="simple" name="juice.newQuantity" id="juicequantity" />&nbsp;gallon</td>
		<td>Current available quantity is <s:property value="%{juice.quantity}"/>&nbsp;gallon</td>
		<td><s:hidden name="juicemaxorderquantity" id="juicemaxorderquantity" value="%{juice.newQuantity}"/></td>
		<td><s:hidden name="juice.itemId" id="juice.itemId" /></td>
</tr>
<tr>
		<td><s:property value='veggies.itemName'/></td>
		<td><s:hidden theme="simple" name="veggies.minQuant" id="veggiesminQuant" /></td>
		<td><s:hidden theme="simple" name="veggies.maxQuant" id="veggiesmaxQuant" /></td>
		<td><s:hidden name="veggies.itemName" id="veggies.itemName" /></td>
		<td><s:textfield theme="simple" name="veggies.newQuantity" id="veggiesquantity" />&nbsp;lb</td>
		<td>Current available quantity is <s:property value="%{veggies.quantity}"/>&nbsp;lb</td>
		<td><s:hidden name="veggiesmaxorderquantity" id="veggiesmaxorderquantity" value="%{veggies.newQuantity}"/></td>
		<td><s:hidden name="veggies.itemId" id="veggies.itemId" /></td>
</tr>
<tr></tr>
<tr>
<td><s:submit theme="simple" onclick="return validatePrint();" type="submit" value="Print" name="PRINT" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit></td>
<td></td>
<td></td>
<td></td>
<td><s:submit theme="simple"  onclick="return validateOrder();" type="submit" value="Online Order" name="ONLINEORDER" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit></td>
<td></td>
<td></td>
<td></td>
</tr>


</tbody>

</table>

<br>
<!-- <s:submit theme="simple" onclick="return validatePrint();" type="submit" value="Print" name="PRINT" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>
<s:submit onclick="return validateOrder();" type="submit" value="Online Order" name="ONLINEORDER" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>
-->
</form>

</body>
</html>