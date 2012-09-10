<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<%@ attribute name="showlabel" required="false" type="java.lang.String" %>
<c:set var="field" value="${pageItem.form_field}" />
<c:if test="${showlabel != '0'}">
<label><bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" />: <c:if test='${field.required}'><span class="asterix">*</span></c:if></label>
</c:if>
<c:choose>
    <c:when test="${! empty pageItem.visibleEnumIdTrigger1}">
        <c:choose>
		<c:when test="${pageItem.visibleEnumIdTrigger1 == 1 && pageItem.visibleEnumIdTrigger2 == 0}">
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="1" onclick="toggleField2DepsChoice('Yes/No', ${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', ${pageItem.visibleEnumIdTrigger2}, '${pageItem.childIdentifier2}','${field.identifier}');" /><label for="${field.identifier}">Yes</label>
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0" onclick="toggleField2DepsChoice('Yes/No', ${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', ${pageItem.visibleEnumIdTrigger2}, '${pageItem.childIdentifier2}','${field.identifier}');"/><label for="${field.identifier}">No</label>
        </c:when>
        <c:when test="${pageItem.visibleEnumIdTrigger1 == 1}">
            <c:choose>
            <c:when test="${pageItem.inputType == 'collapsing-tbl-for-yesno'}">
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="1" onclick="toggleField('Yes/No Table',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');" /><label for="${field.identifier}">Yes</label>
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0" onclick="toggleField('Yes/No Table',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');"/><label for="${field.identifier}">No</label>
            <input type="radio" name="${field.identifier}" value=""/><label for="${field.identifier}">N/A</label>
            </c:when>
            <c:otherwise>
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="1" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');" /><label for="${field.identifier}">Yes</label>
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');"/><label for="${field.identifier}">No</label>
            <input type="radio" name="${field.identifier}" value=""/><label for="${field.identifier}">N/A</label>
            </c:otherwise>
            </c:choose>
        </c:when>
		<c:when test="${pageItem.visibleEnumIdTrigger1 == 0}">
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="1" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');" /><label for="${field.identifier}">Yes</label>
            <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');"/><label for="${field.identifier}">No</label>
        </c:when>
        <c:otherwise>
        <html:radio property="${field.identifier}" styleId="${field.identifier}Y" value="1" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');" /><label for="${field.identifier}Y">Yes</label>
        <html:radio property="${field.identifier}" styleId="${field.identifier}N" value="0" onclick="toggleField('Yes/No',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}', '${field.identifier}');"/><label for="${field.identifier}N">No</label>
        <input type="radio" name="${field.identifier}" value=""/><label for="${field.identifier}">N/A</label>
        </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${! empty pageItem.childIdentifier1}">
        <html:radio property="${field.identifier}" styleId="${field.identifier}" value="1" onclick="toggleField('Yes/No',1, '${pageItem.childIdentifier1}', '${field.identifier}');" /><label for="${field.identifier}">Yes</label>
        <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0" onclick="toggleField('Yes/No',1, '${pageItem.childIdentifier1}', '${field.identifier}');"/><label for="${field.identifier}">No</label>
        <input type="radio" name="${field.identifier}" value=""/><label for="${field.identifier}">N/A</label>
    </c:when>
    <c:otherwise><%--<bean:define id="thisValue" name="${encounterForm.classname}" property="${field.identifier}"/>${thisValue}--%>
        <html:radio property="${field.identifier}" styleId="${field.identifier}"  value="1"/><label for="${field.identifier}">Yes</label>
        <html:radio property="${field.identifier}" styleId="${field.identifier}" value="0"/><label for="${field.identifier}">No</label>
        <input type="radio" name="${field.identifier}" value=""/><label for="${field.identifier}">N/A</label>
    </c:otherwise>
</c:choose>