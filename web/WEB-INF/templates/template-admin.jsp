<%@ page import="org.rti.zcore.utils.SessionUtil"%>

<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%@ taglib uri="/WEB-INF/tlds/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/zeprs.tld" prefix="zeprs" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tlds/struts-layout.tld" prefix="layout" %>
<jsp:useBean id="now" class="java.util.Date" />
<%
    // String hostname = request.getServerName();
    String hostname = "192.168.20.6";
    pageContext.setAttribute("hostname",hostname);
%>
<html>
    <head>
        <title><%=request.getUserPrincipal().getName() %>&nbsp;<%=SessionUtil.getInstance(session).getClientSettings().getSite().getName()%>&nbsp;<template:get name='title'/></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script type="text/javascript" src="/${appName}/js/browser_detect.js;jsessionid=${pageContext.request.session.id}"></script>
        <script language="JavaScript" TYPE="text/javascript" src="/${appName}/js/validation.js;jsessionid=${pageContext.request.session.id}"></script>
        <script type="text/javascript" src="/${appName}/js/zeprs.js;jsessionid=${pageContext.request.session.id}"></script>
        <script language="JavaScript1.2" TYPE="text/javascript" src="/${appName}/js/menu_code.js;jsessionid=${pageContext.request.session.id}"></script>
	    <script language="JavaScript" TYPE="text/javascript" src="/${appName}/js/util.js;jsessionid=${pageContext.request.session.id}"></script>
	    <script language="JavaScript" TYPE="text/javascript" src="/${appName}/js/menu_settings.js;jsessionid=${pageContext.request.session.id}"></script>
        <script language="JavaScript" TYPE="text/javascript" src="/${appName}/config/javascript.js;jsessionid=${pageContext.request.session.id}"></script>
        <script type="text/javascript" src="/${appName}/js/dwr-admin.js;jsessionid=${pageContext.request.session.id}"></script>
        <script type='text/javascript' src='/${appName}/dwr/util.js;jsessionid=${pageContext.request.session.id}'></script>
        <script type='text/javascript' src='/${appName}/js/engine2.jsp;jsessionid=${pageContext.request.session.id}'></script>
        <script type="text/javascript" src="/${appName}/js/fat.js;jsessionid=${pageContext.request.session.id}"></script>

        <script type="text/javascript">
            //<![CDATA[
            var output = '';
            if (browser.isGecko)
            {
            output += '<link rel="stylesheet" href="/${appName}/css/styles-moz.css;jsessionid=${pageContext.request.session.id}" charset="ISO-8859-1" type="text/css">';
            }
            else
            {
            output += '<link rel="stylesheet" href="/${appName}/css/styles-ie.css;jsessionid=${pageContext.request.session.id}" charset="ISO-8859-1" type="text/css">';
            }
            document.write(output);
            //]]>
         </script>
    </head>
    <body onload="hide_toggles();DWRUtil.useLoadingMessage();">
    <%--
        <form action="${pageContext.request.contextPath}/search.do;jsessionid=${pageContext.request.session.id}" method="post"><input type="text" name="search_string">
    </form>
    --%>
    <div id="banner-home">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td valign="left" background="/${appName}/images/banner_bkgd.gif" height="46" width="100" ><span class="serviceHeader"><a href="/${appName}/home.do;jsessionid=${pageContext.request.session.id}" border="0">ZEPRS</a></span></td>
                <td background="/${appName}/images/banner_bkgd.gif" class="bannerLabel">&nbsp;</td>
                <td background="/${appName}/images/banner_bkgd.gif" align="right">
                <logic:present role="ALTER_PROGRAMS_AND_SCREEN_APPEARANCE">
                <html:link action="/admin/home">admin</html:link> |
                </logic:present><a href="http://${hostname}/referral" target="_top">referral</a> | <a href="http://${hostname}/mail" target="_top">webmail</a> | <a href="http://${hostname}/training" target="_top">training</a>&nbsp;&nbsp;</td>
            </tr>
        </table>
    </div>
            <div id="content-admin">

            <h2><template:get name='header' ignore="true"/></h2>
            <template:get name='content'/>
            </div>
            <div id="adminHelp">
            <template:get name='help'/>
            </div>
    </body>
</html>

