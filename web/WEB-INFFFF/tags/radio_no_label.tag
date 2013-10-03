<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<c:set var="field" value="${pageItem.form_field}" />
<c:forEach var="enum" begin="0" items="${field.enumerations}"  varStatus="ctr">
    <c:choose>
           <c:when test="${(pageItem.visibleEnumIdTrigger1 > 0)}">
                <html:radio property="${field.identifier}" styleId="${field.identifier}${enum.id}" value="${enum.id}" onchange="toggleField('radio',${pageItem.visibleEnumIdTrigger1}, '${pageItem.childIdentifier1}','${field.id}${enum.id}');"/> ${enum.enumeration}<br/>
            </c:when>
            <c:otherwise>
               <html:radio property="${field.identifier}" value="${enum.id}"/> ${enum.enumeration}<br/>
            </c:otherwise>
     </c:choose>
</c:forEach>