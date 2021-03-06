<%--
  Created by IntelliJ IDEA.
  User: ckelley
  Date: Apr 11, 2005
  Time: 12:38:08 PM
--%>
<%@ page import="org.rti.zcore.utils.SessionUtil,
                 org.rti.zcore.Patient"%>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tlds/zeprs.tld" prefix="zeprs" %>
<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-layout.tld" prefix="layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:choose>
    <c:when test="${! empty param.template}">
    <c:set var="template" value="/WEB-INF/templates/${appTemplateDir}/template-print.jsp"/>
    </c:when>
    <c:otherwise>
    <c:set var="template" value="/WEB-INF/templates/${appTemplateDir}/template.jsp"/>
    </c:otherwise>
</c:choose>
<template:insert template='${template}'>
<template:put name='title' content='' direct='true'/>
<template:put name='content' direct='true'>
<script language="JavaScript" type='text/javascript' src='/${appName}/js/engine2.jsp;jsessionid=${pageContext.request.session.id}'></script>
<script language="JavaScript" type='text/javascript' src='/${appName}/dwr/util.js;jsessionid=${pageContext.request.session.id}'></script>
<script language="JavaScript" type='text/javascript' src='/${appName}/dwr/interface/WidgetDisplay.js;jsessionid=${pageContext.request.session.id}'></script>
<script language="JavaScript" type='text/javascript' src='/${appName}/dwr/interface/Encounter.js;jsessionid=${pageContext.request.session.id}'></script>
<script language="JavaScript" type="text/javascript" src="/${appName}/js/dwr-generic.js;jsessionid=${pageContext.request.session.id}"></script>
<script language="JavaScript" type="text/javascript" src="/${appName}/js/dwr-display.js;jsessionid=${pageContext.request.session.id}"></script>

<script type="text/javascript" language="Javascript1.1">

<!-- Begin

function submitForm() {
    bCancel=false;
    bCancel =  validateForm${encounterForm.id}(document.form${encounterForm.id});
    if (bCancel == true) {
    document.form${encounterForm.id}.submit();
    }
}

//End -->
</script>
<c:choose>
    <c:when test="${! empty param.template}">
    <div id="form-print">
    </c:when>
    <c:otherwise>
    <div id="widePage3">
    </c:otherwise>
</c:choose>
<h2>Puerperium</h2>
<logic:messagesPresent>
   <bean:message key="errors.header"/>
   <html:messages id="error">
      <li class="valError"><bean:write name="error"/></li>
   </html:messages>
   </ul>
</logic:messagesPresent>
<html:form action="${encounterForm.classname}/save.do" onsubmit="return validateForm${encounterForm.id}(this);">
<c:choose>
<c:when test="${! empty chartItems}">
<table cellpadding="1" cellspacing="1" class="enhancedtabletighter">
</c:when>
<c:otherwise>
<table cellpadding="1" cellspacing="1" class="enhancedtabletighter">
</c:otherwise>
</c:choose>

<%--<c:if test="${!empty chartItems}">--%>
<%@ include file="/WEB-INF/pages/encounters/encounter_form_layout_chart.jsp" %>
<%--</c:if>
<c:if test="${empty chartItems}">
<%@ include file="/WEB-INF/pages/encounters/encounter_form_layout_chart_new.jsp" %>
</c:if>--%>

</table>
<html:javascript formName="${encounterForm.classname}" dynamicJavascript="true" staticJavascript="false"/>
</html:form>
<c:import url="../problems/problems_chart.jsp" />
</template:put>
</template:insert>