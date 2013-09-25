<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt" %>
<%@ attribute name="pageItem" required="false" type="org.rti.zcore.PageItem" %>
<c:set var="field" value="${pageItem.form_field}" />
<jsp:useBean id="drugRegimenList" scope="request" type="java.util.List" />
<jsp:useBean id="drugRegimenListSecondary" scope="request" type="java.util.List" />

<div class="row"><span class="labelNoBold"><bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" />: <c:if test='${field.required}'><span class="asterix">*</span> </c:if></span>
<span class="formw"><c:forEach var="regimen" begin="0" items="${drugRegimenList}">
    <html:radio property="${field.identifier}" value="${regimen.id}"/> ${regimen.name}<br/>
</c:forEach>
</span>
</div>
<div class="row">&nbsp;</div>
<div class="row"><span class="labelNoBold">Secondary Line Regimens:</span>
<span class="formw">
<select id="select${field.identifier}" name="${field.identifier}" onchange="toggleField('dropdown',200, '1833','${field.id}');">
<option value="">-- Select --</option>
<c:forEach var="regimen" begin="0" items="${drugRegimenListSecondary}">
<c:choose>
    <c:when test="${regimen.id == 200}" ></c:when>
    <c:otherwise><option value="${regimen.id}">${regimen.name}</option></c:otherwise>
</c:choose>
</c:forEach>
<option value="200">Other</option>
</select>
</span>
</div>
