<%@ tag import="org.rti.zcore.utils.SessionUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tlds/fmt.tld" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/tlds/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ attribute name="pageItem" required="true" type="org.rti.zcore.PageItem" %>
<%@ attribute name="edit" required="false" type="java.lang.String" %>
<c:set var="field" value="${pageItem.form_field}" />

<%
    java.util.Calendar c = java.util.Calendar.getInstance();
    c.add(java.util.Calendar.WEEK_OF_MONTH, +1);
    request.setAttribute("date1weekfuture", c.getTime());
    c.add(java.util.Calendar.WEEK_OF_MONTH, +1);
    request.setAttribute("date2weekfuture", c.getTime());
    c.add(java.util.Calendar.WEEK_OF_MONTH, -2);
    c.add(java.util.Calendar.MONTH, +1);
    request.setAttribute("date1monthfuture", c.getTime());
    c.add(java.util.Calendar.MONTH, +1);
    request.setAttribute("date2monthfuture", c.getTime());
    c.add(java.util.Calendar.MONTH, +1);
    request.setAttribute("date3monthfuture", c.getTime());
    c.add(java.util.Calendar.MONTH, +3);
    request.setAttribute("date6monthfuture", c.getTime());
%>
<jsp:useBean id="now" class="java.util.Date" />
<bean:define id="dateFromDb" name="${encounterForm.classname}" property="${field.identifier}"/>
<c:choose>
    <c:when test="${! empty dateFromDb}">
    <c:forTokens items="${dateFromDb}" delims="-" var="dateItem" varStatus="i" >
        <c:choose>
            <c:when test="${i.index==0}">
            <c:set var="yearnow" value="${dateItem}"/>
            </c:when>
            <c:when test="${i.index==1}">
            <c:set var="monthnow" value="${dateItem}"/>
            </c:when>
            <c:when test="${i.index==2}">
            <c:set var="datenow" value="${dateItem}"/>
            </c:when>
        </c:choose>
    </c:forTokens>
    <c:set var="theDate" value="${dateFromDb}"/>
    <c:set var="nicedateVisit" value="${datenow}/${monthnow}/${yearnow}"/>
    <c:set var="dbdateVisit" value="${theDate}"/>
    </c:when>
    <c:otherwise>
        <fmt:formatDate type="both" pattern="yyyy" value="${now}" var="yearnow" />
        <fmt:formatDate type="both" pattern="MM" value="${now}" var="monthnow" />
        <fmt:formatDate type="both" pattern="dd" value="${now}" var="datenow" />
        <c:set var="theDate" value="${now}"/>
        <fmt:formatDate type="both" pattern="dd MMM yy" value="${theDate}" var="nicedateVisit" />
        <fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${theDate}" var="dbdateVisit" />
    </c:otherwise>
</c:choose>
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${now}" var="daynow" />
<c:set var="pastXyear" value="2005"/>
<c:set var="lastTwentyYears" value="${yearnow - 20}"/>
<c:set var="lastYear" value="${yearnow - 1}"/>
<c:set var="twoYears" value="${yearnow + 2}"/>
<c:set var="fourYears" value="${yearnow + 4}"/>
<c:set var="sevenYears" value="${yearnow + 7}"/>
<c:set var="sixtyYears" value="${yearnow - 60}"/>
<c:set var="eightyYears" value="${yearnow - 80}"/>
<jsp:useBean id="date1weekfuture" scope="request" type="java.util.Date" />
<jsp:useBean id="date2weekfuture" scope="request" type="java.util.Date" />
<jsp:useBean id="date1monthfuture" scope="request" type="java.util.Date" />
<jsp:useBean id="date2monthfuture" scope="request" type="java.util.Date" />
<jsp:useBean id="date3monthfuture" scope="request" type="java.util.Date" />
<jsp:useBean id="date6monthfuture" scope="request" type="java.util.Date" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date1weekfuture}" var="fmtdate1weekfuture" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date2weekfuture}" var="fmtdate2weekfuture" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date1monthfuture}" var="fmtdate1monthfuture" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date2monthfuture}" var="fmtdate2monthfuture" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date3monthfuture}" var="fmtdate3monthfuture" />
<fmt:formatDate type="both" pattern="dd MMM yy" value="${date6monthfuture}" var="fmtdate6monthfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date1weekfuture}" var="dbdate1weekfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date2weekfuture}" var="dbdate2weekfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date1monthfuture}" var="dbdate1monthfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date2monthfuture}" var="dbdate2monthfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date3monthfuture}" var="dbdate3monthfuture" />
<fmt:formatDate type="both" pattern="yyyy-MM-dd" value="${date6monthfuture}" var="dbdate6monthfuture" />
<bean:message key="${encounterForm.classname}.${field.identifier}" bundle="${encounterForm.classname}Messages" />: <c:if test='${field.required}'><span class="asterix">*</span> </c:if><br>
<c:choose>
    <c:when test='${pageItem.inputType=="text"}'>
        <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
            <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay"></span> <html:hidden property="${field.identifier}" value="${dbdateVisit}"/>
            <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
            <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="emptyDate"}'>
        <span id="span${field.identifier}" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${lastTwentyYears},${sevenYears});">
            <c:choose>
                <c:when test="${! empty dateFromDb}">${nicedateVisit}</c:when>
                <c:otherwise><img alt="Select Date" border="0" src="/${appName}/images/calendar.gif"></c:otherwise>
            </c:choose>
        </span>
        <html:hidden property="${field.identifier}"/>
        <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
            <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script>
        </div>
    </c:when>
    <c:when test='${pageItem.inputType=="birthdate"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${eightyYears}, ${yearnow}, '', 'age_at_first_attendence');">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" ></span> <html:hidden property="${field.identifier}" styleId="${field.identifier}"/>
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}", "age_at_first_attendence");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="dateToday"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay">${nicedateVisit}</span>
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    <c:choose>
    <c:when test="${edit=='true'}">
    <html:hidden property="${field.identifier}"/>
    </c:when>
    <c:otherwise>
    <html:hidden property="${field.identifier}" value="${daynow}"/>
    </c:otherwise>
    </c:choose>
    </c:when>
    <c:when test='${pageItem.inputType=="date1"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" ></span> <html:hidden property="${field.identifier}"  title="Select Date"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="date2"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" ></span> <html:hidden property="${field.identifier}"  title="Select Date" value="${dbdateVisit}"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="date3"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" >${fmtdate1weekfuture}</span> <html:hidden property="${field.identifier}"  title="Select Date" value="${dbdate1weekfuture}"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="dateOneMonthFuture"}'>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" >${fmtdate1monthfuture}</span> <html:hidden property="${field.identifier}"  title="Select Date" value="${dbdate1monthfuture}"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:when>
    <c:when test='${pageItem.inputType=="date5"}'>

        <table cellpadding="0" cellspacing="0"><tr><td>
            <select name="theDate" onchange="this.form.${field.identifier}.value = theDate[this.selectedIndex].value;document.getElementById('span${field.identifier}').innerHTML = splitDate(theDate[this.selectedIndex].value)">
                <option value="${dbdate1weekfuture}">1 week</option>
                <option value="${dbdate2weekfuture}">2 weeks</option>
                <option value="${dbdate1monthfuture}">1 month</option>
                <option value="${dbdate2monthfuture}">2 months</option>
                <option value="${dbdate3monthfuture}">3 months</option>
                <option value="${dbdate6monthfuture}">6 months</option>
            </select>
        <td align="left">&nbsp;
    <a href="javascript://" onclick="showCalendar(${yearnow},${monthnow},${datenow},'dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" >${fmtdate1weekfuture}</span>
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec",${datenow},${monthnow},${yearnow},"${field.identifier}");</script></div>
    <html:hidden styleClass="disabled-date"  onfocus="this.blur()" property="${field.identifier}"  title="Select Date" value="${dbdate1weekfuture}"/>
    </c:when>

    <c:when test='${pageItem.inputType=="dob"}'>
        <c:choose>
            <c:when test='${param.id != null}'>
            <html:text property="${field.identifier}"/> format: 1989-05-27
            </c:when>

            <c:otherwise>
            <table>
            <tr>
                <td>
                <select name="day" id="day" onchange="calcDOB(${field.identifier})" >
                    <option value="">Not Recorded</option>
                    <c:forEach begin="1" end="31" step="1" var="day">
                    <fmt:formatNumber var="day" value="${day}" pattern="00"/>
                        <c:choose>
                        <c:when test="${day == 1}">
                        <option value="${day}" selected="yes">${day}</option>
                        </c:when>
                        <c:otherwise>
                        <option value="${day}">${day}</option>
                        </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
                </td>
                <td>
                    <select name="month" id="month" onchange="calcDOB(${field.identifier})">
                        <option value="">Not Recorded</option>
                        <option value="01">Jan</option>
                        <option value="02">Feb</option>
                        <option value="03">Mar</option>
                        <option value="04">Apr</option>
                        <option value="05">May</option>
                        <option value="06">Jun</option>
                        <option selected="yes" value="7">Jul</option>
                        <option value="08">Aug</option>
                        <option value="09">Sep</option>
                        <option value="10">Oct</option>
                        <option value="11">Nov</option>
                        <option value="12">Dec</option>
                    </select>
                </td>
                <td>
                    <fmt:formatDate type="both" pattern="yyyy" value="${now}" var="yearnow" />
                    <c:set var="year" value="${yearnow}"/>
                   <select name="year" id="year" onchange="calcDOB(${field.identifier})">
                        <option value="">Not Recorded</option>
                        <option value="${yearnow}">${yearnow}</option>
                        <c:forEach begin="${field.minValue}" end="${yearnow}" step="1" varStatus="cnt">
                        <c:set var="year" value="${yearnow-cnt.count}"/>
                        <option value="${year}">${year}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            </table>
            <br/>
            <span id="span${field.identifier}"></span>
            <html:hidden styleId="${field.identifier}" property="${field.identifier}"/>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test='${pageItem.inputType=="lmp"}'>
            <!--
            Pregnancy Dates Calculator
            February 28, 1999

            This calculator was created by Charles Hu for the Medical College of
            Wisconsin General Internal Medicine Clinic.  This calculator may not be
            copied without the consent from the author.  chuckhu@hotmail.com-->
            <script language="JavaScript" src="/${appName}/js/pregnant.js"></script>
                <input type=hidden name="lmpdate" id="lmpdate">
                    <span id="lmpDay" style="display:none; font-weight: bold;"></span>
                <script language="JavaScript">
                <!--

                //var today = new Date();
                var ltoday = new Date('${yearnow}/${monthnow}/${datenow}');
                var lmm = ltoday.getMonth();
                var ldd = ltoday.getDate();
                var lyy = ltoday.getYear();

                //  The '0' indicates this does NOT come from EDD Form
                 dateSelect(lmm,ldd,lyy,0,"${field.identifier}");
                // -->
                </script>&nbsp;<html:text size="9" styleClass="disabled-date"  onfocus="this.blur()" property="${field.identifier}"/><br/>
                <input type=button name=button value="Calculate EDD" onClick="dueDate(this.form,${field.identifier})">
            </c:when>

            <c:when test='${pageItem.inputType=="edd"}'>
                <input type=hidden name="theDate" id="eddDate">
                <span id="eddDay" style="display:none; font-weight: bold;"></span>
                <script language="JavaScript">
                <!--

                //var today = new Date();
                var etoday = new Date('${yearnow}/${monthnow}/${datenow}');
                var emm = etoday.getMonth();
                var edd = etoday.getDate();
                var eyy = etoday.getYear() + 1;

                //  The last '1' indicates this comes from the EDD form
                dateSelect(emm,edd,eyy,1,"${field.identifier}");

                // -->
                </script>
                &nbsp;<html:text size="9" styleClass="disabled-date" styleId="eddFieldValue" onfocus="this.blur()" property="${field.identifier}"/>
            </c:when>
            <c:when test='${pageItem.inputType=="calendarWidget"}'>
          <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${lastTwoYears},${fourYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" ></span> <html:hidden property="${field.identifier}"  title="Select Date" value="${daynow}"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
         </c:when>
    <c:otherwise>
    <a href="javascript://" onclick="showCalendar('${yearnow}','${monthnow}','${datenow}','dd MMM yy','${encounterForm.classname}','${field.identifier}',event, ${pastXyear},${sevenYears});">
    <img alt="Select Date" border="0" src="/${appName}/images/calendar.gif" align="middle">&nbsp;&nbsp;</a><span id="span${field.identifier}" class="dateDisplay" ></span> <html:hidden property="${field.identifier}"  title="Select Date" value="${daynow}"  />
    <div id="slcalcod${field.identifier}" style="position:absolute; left:100px; top:100px; z-index:10; visibility:hidden;">
    <script type="text/javascript">printCalendar("Sun","Mon","Tue","Wed","Thu","Fri","Sat","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec","${datenow}","${monthnow}","${yearnow}","${field.identifier}");</script></div>
    </c:otherwise>
</c:choose>