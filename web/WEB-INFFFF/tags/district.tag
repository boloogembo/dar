<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<c:set var="field" value="${pageItem.form_field}" />
<jsp:useBean id="districts" scope="request" type="java.util.List" />
<bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" />: <c:if test='${field.required}'><span class="asterix">*</span> </c:if><br>
<select name="${field.identifier}" id="district">
<option value="">-- Select --</option>
<c:forEach var="district" begin="0" items="${districts}">
<option value="${district.districtId}">${district.districtName}</option>
</c:forEach>
<option value="1000">Other</option>
</select>
