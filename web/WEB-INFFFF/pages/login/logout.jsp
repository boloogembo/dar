<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri='/WEB-INF/tlds/struts-html.tld' prefix='html' %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<template:insert template='login-template.jsp'>
<template:put name='title' content='Logout' direct='true'/>
    <h2>Logout</h2>
<template:put name='content' direct='true'>
<p>You are logged out.</p>
</template:put>
</template:insert>