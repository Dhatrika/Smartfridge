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
</head>


<body>

<form name="homeSymbol" id="homeSymbol" action="internalLoginRedirect.action" method="post">
<s:submit theme="simple" type="submit" value="Home" name="Home" cssStyle="color: #FFFFFF; font-size: 11px; text-align:center; font-weight: bold;  line-height: 23px; height: 23px; padding: 0px 10px 0px 10px; background-color: #454FA2; border: 0px; border-radius: 4px; -webkit-border-radius: 4px; -moz-border-radius: 4px; margin-right: 99px;"></s:submit>
</form>

<h3>Status of the items in the Smart fridge</h3>

<form name="statusItemsForm" id="statusItemsForm" method="post">

<table>
<colgroup>
</colgroup>
<tbody>

<tr>
		<td><s:label theme = "simple" value='%{milk.itemName}' cssStyle="color:%{milk.statusColor}"/></td>
		<td>Current available quantity is <s:property value="%{milk.quantity}"/>&nbsp;gallon</td>
</tr>
<tr>

		<td><s:label theme = "simple" value='%{eggs.itemName}' cssStyle="color:%{eggs.statusColor}"/></td>
		<td>Current available quantity is <s:property value="%{eggs.quantity}"/>&nbsp;dozen</td>
</tr>
<tr>

		<td><s:label theme = "simple" value='%{juice.itemName}' cssStyle="color:%{juice.statusColor}"/></td>
		<td>Current available quantity is <s:property value="%{juice.quantity}"/>&nbsp;gallon</td>
</tr>
<tr>
		<td><s:label theme = "simple" value='%{veggies.itemName}' cssStyle="color:%{veggies.statusColor}"/></td>
		<td>Current available quantity is <s:property value="%{veggies.quantity}"/>&nbsp;lb</td>
</tr>
</tbody>

</table>

</form>

</body>
</html>