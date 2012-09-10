<%@ taglib uri='/WEB-INF/tlds/struts-tiles.tld' prefix='template' %>
<%
     String pageURL = request.getRequestURL().toString();
     pageContext.setAttribute("pageURL",pageURL);

     String queryString = request.getQueryString();
     pageContext.setAttribute("queryString",queryString);

     String printTemplateURL = "";
     if (queryString !=null) {
        printTemplateURL = pageURL +"?" + queryString + "&template=print";
     } else {
        printTemplateURL = pageURL +"?template=print";
     }

    pageContext.setAttribute("printTemplateURL",printTemplateURL);

    // String hostname = request.getServerName();
    String hostname = "192.168.20.6";
    pageContext.setAttribute("hostname",hostname);

%>
<html>
    <head>
        <title><template:get name='title'/></title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <script type="text/javascript" src="/${appName}/js/browser_detect.js;jsessionid=${pageContext.request.session.id}"></script>
        <script language="JavaScript" TYPE="text/javascript" src="/${appName}/js/validation.js;jsessionid=${pageContext.request.session.id}"></script>
        <script type="text/javascript" src="/${appName}/js/zeprs.js;jsessionid=${pageContext.request.session.id}"></script>
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
    <body>
    <div id="banner-home">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td align="center" valign="middle" height="46" width="100" ><span class="serviceHeader"><a href="/${appName}/home.do;jsessionid=${pageContext.request.session.id}" border="0">${appTitle}</a></span></td>
                <td class="bannerLabel">&nbsp;</td>
                <td align="right"><a href="/${appName}/referrals.do;jsessionid=${pageContext.request.session.id}" target="_top">referrals</a> | <a href="http://${hostname}/mail" target="_top">webmail</a> | <a href="http://${hostname}/training" target="_top">training</a>&nbsp;&nbsp;</td>
            </tr>
        </table>
    </div>

            <div id="maincontent-home">
            <h1><template:get name='header' ignore="true"/></h1>
            <template:get name='content'/>
            </div>
    </body>
</html>