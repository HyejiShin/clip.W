<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
      <%
         String session_name=(String)session.getValue("user");
         String session_id=(String)session.getValue("id");
         String log;
         String masterID="admin";
         String master="관리자";
         if(session_name==null)
            log="<a href=login.jsp>SIGN IN</a>";
         else
            log="<a href=logout.jsp>LOG OUT</a>";
      %>

<header class="header">
   <ul class="menu">
      <li><a class="m_main" href="main.jsp">HOME</a></li>
      <li><a class="m_video" href="video.jsp">VIDEO</a></li>
      <li><a class="m_scenario" href="scenario.jsp">SCENARIO</a></li>
      <li><a class="m_actor" href="actor.jsp">ACTOR</a></li>
      <li><a class="m_company" href="company.jsp">COMPANY</a></li>
      <li><a class="m_notice" href="notice.jsp">NOTICE</a></li>

      <li style="float: right"><%=log%></li>
      <li style="float: right"><%
      if(masterID.equals(session_id)){%>
         <a href="admin.jsp"><%=session_name%></a>

      <%}
      else if(session_name!=null){%>
         <a class="m_personal" href="personal.jsp"><%=session_name%></a>
      <%}
      %>
      </li>
   </ul>
</header>