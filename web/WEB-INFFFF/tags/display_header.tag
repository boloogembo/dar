<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<c:set var="field" value="${pageItem.form_field}" />
<span class="sectionHeader"> <bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" /></span>