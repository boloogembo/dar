<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt" %>
<%@ attribute name="pageItem" required="false" type="org.rti.zcore.PageItem" %>
<c:set var="field" value="${pageItem.form_field}" />

<jsp:useBean id="labResultEnums" scope="request" type="java.util.List" />
<bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" />:<br/>
<html:select property="${field.identifier}" styleId="result${field.id}">
<option value="">-- Select Type of Lab first --</option>
</html:select>

<script type="text/javascript">
    function populate(fieldId) {
        var selbox = document.getElementById("result${field.id}");
        selbox.options.length = 0;
        selbox.options[selbox.options.length] = new Option('-- Select --','');
        <c:set var="currentFieldId" value="0"/>
    <c:forEach var="result" begin="0" items="${labResultEnums}" varStatus="i">
        <c:choose>
            <c:when test="${result.fieldId == currentFieldId}">
              selbox.options[selbox.options.length] = new Option('${result.enumeration}','${result.id}');
            </c:when>
            <c:otherwise>
            <c:set var="currentFieldId" value="${result.fieldId}"/>
                <c:if test="${i.count != 1}">}</c:if>
               if (fieldId == ${result.fieldId}) {
                   selbox.options[selbox.options.length] = new Option('${result.enumeration}','${result.id}');
            </c:otherwise>
        </c:choose>
    </c:forEach>
                   }
    }
</script>


