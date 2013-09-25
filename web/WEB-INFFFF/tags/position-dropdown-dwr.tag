<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri= "/WEB-INF/tlds/zeprs.tld" prefix="zeprs" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<%@ attribute name="pos" required="true" type="java.lang.Integer" %>
<%@ attribute name="remoteClass" required="true" type="java.lang.String" %>
<%@ attribute name="classname" required="true" type="java.lang.String" %>
<%@ attribute name="propertyName" required="true" type="java.lang.String" %>
<%@ attribute name="patientId" required="true" type="java.lang.Integer" %>
<%@ attribute name="eventId" required="true" type="java.lang.Integer" %>
<%@ attribute name="user" required="true" type="java.lang.String" %>
<%@ attribute name="siteId" required="true" type="java.lang.Integer" %>
<%@ attribute name="value" required="false" type="java.lang.String" %>
<%@ attribute name="formId" required="true" type="java.lang.Integer" %>
<c:set var="field" value="${pageItem.form_field}" />
<c:set var="scriptName" value="reply${field.identifier}"/>
<c:choose>
    <c:when test="${! empty value}">
    <span id="${field.identifier}Results${pos}">${value}</span>
    <select name="${field.identifier}" id="${field.identifier}Field${pos}" onchange="insertSelectStringField('${remoteClass}', ${scriptName}, '${classname}','${field.identifier}', ${pos},'${field.identifier}Field${pos}',${patientId}, ${eventId},'${user}',${siteId},${formId})" style="display:none;">
        <option value="" selected="selected"> -- </option>
        <option value="Occiput Posterior">OP</option>
        <option value="Right Occiput Posterior">ROP</option>
        <option value="Right Occiput Transverse">ROT</option>
        <option value="Right Occiput Anterior">ROA</option>
        <option value="Occiput Anterior">OA</option>
        <option value="Left Occiput Anterior">LOA</option>
        <option value="Left Occiput Transverse">LOT</option>
        <option value="Left Occiput Posterior">LOP</option>
</select>
    </select>
    </c:when>
    <c:otherwise>
        <span id="${field.identifier}Results${pos}"></span>
        <select name="${field.identifier}" id="${field.identifier}Field${pos}" onchange="insertSelectStringField('${remoteClass}', ${scriptName}, '${classname}','${field.identifier}', ${pos},'${field.identifier}Field${pos}',${patientId}, ${eventId},'${user}',${siteId})">
            <option value="" selected="selected"> -- </option>
            <option value="Occiput Posterior">OP</option>
            <option value="Right Occiput Posterior">ROP</option>
            <option value="Right Occiput Transverse">ROT</option>
            <option value="Right Occiput Anterior">ROA</option>
            <option value="Occiput Anterior">OA</option>
            <option value="Left Occiput Anterior">LOA</option>
            <option value="Left Occiput Transverse">LOT</option>
            <option value="Left Occiput Posterior">LOP</option>
    </c:otherwise>
    </c:choose>
<script type='text/javascript'>
    var ${scriptName} = function(data)
    {
    var dvals = data.split("=");
    var key = "${field.identifier}Results" + dvals[1];
    var value =dvals[0];
    var itemValue = document.getElementById(key);
    itemValue.innerHTML = value;
    var input =  document.getElementById("${field.identifier}Field" + dvals[1]);
    input.style.display = "none";
    input.style.visibility = "hidden";
    }
</script>