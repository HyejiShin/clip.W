<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="javax.activation.*" %>
<%@ page import="javax.mail.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="javax.mail.internet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css">
<title>Send Mail</title>
<style>
	body{
		background: #333;
	}
	.m_personal{
		background-color:#f62217;
	}
	td{
		text-align:center;
		padding: 1em;
		vertical-align: top;
	}
	div{
		border-color: lightgrey;
		border-style: solid;
		border-width: 2px;
		margin: 50px 180px;
	}
	input[type=e-mail], input[type=text]{
		background-color:white;
		color: black;
		text-align: center;
	}
	textarea{
		background-color:white;
		color: black;
		text-align:center;
	}
	input[type=submit]{
		padding: 1em;
		border:0;
		align: center;
		background-color:  #f62217;
	}
	input[type=submit]:hover{
		padding: 1em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
	#footer{
		border: 0px;
		margin: 0px;
	}
</style>
</head>
<body>
<%@ include file="top.jsp" %>
<table align="center" width="40%" style="margin-top: 100px">
	<tr>
		<td><a href="personal.jsp"><img src="images/home2.png" width="50px"></a></td>
		<td><a href="show_all.jsp"><img src="images/file.png" width="50px"></a></td>
		<td><a href="contact.jsp"><img src="images/mail.png" width="50x"></a></td>
	</tr>
</table>
<%
	String to=request.getParameter("id");
	Connection myConn = null;
  	Statement stmt = null;	
  	String mySQL = null;

  	String dburl  = "jdbc:mysql://localhost:3306/mydb";
  	String user="root";
  	String passwd="admin";
  	String driver = "com.mysql.jdbc.Driver";

  	Class.forName(driver);	
  	myConn= DriverManager.getConnection(dburl, user, passwd);
    
  	stmt = myConn.createStatement();  
    mySQL = "select * from member where id='"+session_id+"'";
    ResultSet myResultSet = stmt.executeQuery(mySQL);
    if(myResultSet.next()){
    	String id=(String)myResultSet.getObject(1);
    	%>
    	<form name="msg" action="sendMail.jsp">
    	<div>
        	<table align="center">
        	<tr>
        		<td size="10%" style="font-size: 1.1em; color: white">TO</td>
        		<td><input type="e-mail" name="to" size="100%" placeholder="E-MAIL" value="<%if(to!=null){%><%=to%><%}%>" required></td>
        	</tr>
        	<tr>
        		<td size="10%" style="font-size: 1.1em; color:white">SUBJECT</td>
        		<td><input type="text" name="subject"  size="100%" required></td>
        	</tr>
    		<tr>
    			<td size="10%" style="font-size: 1.1em; color:white">MESSAGE</td>
    			<td><textarea name="message" cols="100%" rows="20" required></textarea></td>
    		</tr>
    		<tr><td colspan="2"><input type="submit" value="SEND"></td></tr>
        	</table>
    	</div>
    	</form>
    <%}
    else{
    	mySQL="select * from groupTable where id='"+session_id+"'";
    	myResultSet=stmt.executeQuery(mySQL);
    	if(myResultSet.next()){
    		String id=(String)myResultSet.getObject(1);
    		%>
        	<form name="msg" action="sendMail.jsp">
        	<div>
			<table align="center">
        	<tr>
        		<td size="10%" style="font-size: 1.1em; color:white">TO</td>
        		<td><input type="e-mail" name="to" size="100%" placeholder="E-MAIL" value="<%if(to!=null){%><%=to%><%}%>" required></td>
        	</tr>
        	<tr>
        		<td size="10%" style="font-size: 1.1em; color:white">SUBJECT</td>
        		<td><input type="text" name="subject"  size="100%" required></td>
        	</tr>
    		<tr>
    			<td size="10%" style="font-size: 1.1em; color:white">MESSAGE</td>
    			<td><textarea name="message" cols="100%" rows="20" required></textarea></td>
    		</tr>
    		<tr><td colspan="2"><input type="submit" value="SEND"></td></tr>
        	</table>
        	</div>
        	</form>
        <%
    	}
    }
    stmt.close();
    myConn.close();
%>
<div id="footer" style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>