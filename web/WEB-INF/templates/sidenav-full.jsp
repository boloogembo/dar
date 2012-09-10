<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/zeprs.tld" prefix="zeprs" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:useBean id="now" class="java.util.Date" />
<div id="patientStatus">
        <table cellpadding="0" cellspacing="0" bgColor = "white" summary="Patient Status Bar" width="100%">
        <thead>
            <tr class="patientrowheader">
                <th>Staff</th>
                <th>Patient</th>
                <th>NRC Number</th>
                <th>District ID</th>
                <th>Date/Time</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="patientrow">${zeprs_session.fullname}</td>
                <td class="patientrow"><html:link styleClass="patient" action="patientHome" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id" >
        ${fn:substring(zeprs_session.sessionPatient.surname,0,15)},${fn:substring(zeprs_session.sessionPatient.firstName,0,10)}</html:link></td>
                <td class="patientrow">${zeprs_session.sessionPatient.nrcNumber}</td>
                <td class="patientrow">${zeprs_session.sessionPatient.districtPatientid}</td>
                <td class="patientrow"><fmt:formatDate type="both" pattern="dd/MM/yy" value="${now}" />&nbsp;<input type="text" id="pcTime" size="7" class="clock" onfocus="this.blur()"/></td>
            </tr>
        </tbody>
        </table>
    </div>

    <c:url value="patientTask.do" var="ante"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="1"/></c:url>
    <c:url value="patientTask.do" var="history"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="2"/></c:url>
    <c:url value="pregnancyDating.do" var="pregnancyDating"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/></c:url>
    <c:url value="patientTask.do" var="intra"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="3"/></c:url>
    <c:url value="patientTask.do" var="post"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="4"/></c:url>
    <c:url value="patientTask.do" var="nicu"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="5"/></c:url>
    <c:url value="discharge.do" var="uth"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/></c:url>
    <c:url value="patientTask.do" var="safe"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="103"/></c:url>
    <c:url value="patientTask.do" var="emerg"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="7"/></c:url>
    <c:url value="patientTask.do" var="ultra"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="8"/></c:url>
    <c:url value="patientHome.do" var="mother"><c:param name="patientId" value="${zeprs_session.sessionPatient.parentId}"/><c:param name="eventId" value="${zeprs_session.sessionPatient.currentEventId}"/></c:url>
    <c:url value="currentMedicine.do" var="meds"><c:param name="patientId" value="${zeprs_session.sessionPatient.parentId}"/></c:url>
<%--
    <c:url value="patientTask.do" var="lab"><c:param name="patientId" value="${zeprs_session.sessionPatient.id}"/><c:param name="flowId" value="102"/></c:url>
--%>
<%--</c:if>--%>
<%--<template:get name='history'/>
        <template:get name='related'/>--%>
<%--<c:if test="${(! empty zeprs_session.sessionPatient) || (encounterForm.id != 1)}" >
    <c:if test="${encounterForm.id != 1}">--%>
    <div id="sidebar-a">
        <div id="sidenavcontainer">
            <ul id="navlist">
                <li style="font-size: 11pt;"><a href="/${appName}/home.do;jsessionid=${pageContext.request.session.id}">Home</a></li>
                <c:choose>
                <c:when test="${zeprs_session.sessionPatient.currentEventId == -1}">
                <li><html:link action="/demographics.do" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id">Demographics</html:link></li>
                    <c:if test="${(!empty zeprs_session.sessionPatient.currentPregnancyId) || (param.pregnancy == -1)}">
                    <li><a href='<c:out value="/${appName}/${history}"/>'>History/Dating</a></li>
                    </c:if>
                </c:when>
                <c:when test="${empty zeprs_session.sessionPatient.parentId}">
                <li><html:link action="/demographics.do" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id">Demographics</html:link></li>
                    <c:if test="${(!empty zeprs_session.sessionPatient.currentPregnancyId) || (param.pregnancy == -1)}">
                    <li><a href='<c:out value="/${appName}/${history}"/>'>History/Dating</a></li>
                    <c:choose>
                    <c:when test="${!empty zeprs_session.sessionPatient.dateEventEnd || !empty zeprs_session.sessionPatient.currentEgaDaysDB}">
                        <li><html:link action="/patientAnte.do" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id">Antepartum</html:link></li>
                        <li><html:link action="/safeMotherhood.do" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id">Safe Motherhood</html:link></li>
                        <li><html:link action="/currentMedicine.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">Medications</html:link></li>
	                    <li><a href='<c:out value="/${appName}/${emerg}"/>'>Problem or Labor Visit</a></li>
	                    <c:if test="${! empty zeprs_session.sessionPatient.partographStatus || ! empty zeprs_session.sessionPatient.dateActiveLabour}">
	                    <li><html:link action="partograph.do">Partograph</html:link></li>
	                    </c:if>
	                    <li><a href='<c:out value="/${appName}/${post}"/>'>Postnatal/ Delivery Summary</a></li>
	                    <li><a href='<c:out value="/${appName}/${uth}"/>'>UTH Registry</a></li>
	                    <li><html:link action="/problem.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">Problem List</html:link></li>
	                    <li><a href='<c:out value="/${appName}/${ultra}"/>'>Ultrasound</a></li>
	                    <li><html:link action="/labs.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">Labs</html:link></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Antepartum</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Safe Motherhood</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Medications</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Problem or Labor Visit</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Partograph</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Postnatal/ Delivery Summary</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">UTH Registry</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Problem List</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Ultrasound</a></li>
                        <li><a href="#" onclick="alert('You must complete the Pregnancy Dating section first.');window.location.href='/${appName}/${pregnancyDating}';">Labs</a></li>
                    </c:otherwise>
                    </c:choose>
                    </c:if>
                    <c:if test="${! empty sessionPatient.children}">
                    <li style="margin: 0px 0px 0px 5px;" title="Children in ${appTitle} System">Children</li>
                    <logic:iterate id="child" name="sessionPatient" property="children">
                    <li><html:link action="patientHome" paramId="patientId" paramName="child" paramProperty="id">${fn:substring(child.surname,0,6)},${fn:substring(child.firstName,0,6)}</html:link>
                    </logic:iterate>
                    </c:if>
                </c:when>
                <c:otherwise>
                <li><html:link action="/demographics.do" paramId="patientId" paramName="zeprs_session" paramProperty="sessionPatient.id">Demographics</html:link></li>
                <li><html:link action="/problem.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">Problem List</html:link></li>
                <li><a href='<c:out value="/${appName}/${post}"/>'>Postnatal/ Delivery Summary</a></li>
                <li><html:link action="/labs.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">Labs</html:link></li>
                <!--
                <li><html:link action="/arv.do" paramId="patientId"  paramName="zeprs_session" paramProperty="sessionPatient.id">ARV</html:link></li>
                -->
                <li><a href='<c:out value="/${appName}/${uth}"/>'>UTH Registry</a></li>
                <li><a href='<c:out value="/${appName}/${nicu}"/>'>NICU/Pediatrics</a></li>
                <logic:notEmpty name="zeprs_session" property="sessionPatient.parentId">
                <li style="margin: 0px 0px 0px 5px;">Mother</li>
                <li><a href='<c:out value="/${appName}/${mother}"/>'>${fn:substring(sessionPatient.mother.surname,0,6)},${fn:substring(sessionPatient.mother.firstName,0,6)}</a></li>
                </logic:notEmpty>
                </c:otherwise>
                </c:choose>
                <li style="margin: 0px 0px 0px 5px;">&nbsp;</li>
                <li><html:link  action="/referrals.do">Referrals</html:link></li>
                <logic:present role="VIEW_SELECTED_REPORTS_AND_VIEW_STATISTICAL_SUMMARIES">
                <li><html:link  action="/reports.do">Reports</html:link></li>
                </logic:present>
                <li><html:link  action="/help.do">Help</html:link></li>
                <li style="margin: 0px 0px 0px 5px;">&nbsp;</li>
                <li><a href="http://192.168.20.6/mail" target="_top">Webmail</a></li>
                <li><a href="http://192.168.20.6/training" target="_top">Training</a></li>

               <%-- <li style="margin: 0px 0px 0px 5px;">&nbsp;</li>
           <li><a href='<%= response.encodeURL(printTemplateURL) %>'>Print Version</a></li>--%>

                <logic:present role="ALTER_PROGRAMS_AND_SCREEN_APPEARANCE">
                <li style="margin: 0px 0px 0px 5px;">&nbsp;</li>
                <li><html:link action="/admin/home.do">Admin</html:link></li>
                </logic:present>
                <li><html:link  action="/logout.do">Logout</html:link></li>

            </ul><!-- navlist -->
        </div> <!-- sidenavcontainer -->
    </div><!-- sidebar-a -->