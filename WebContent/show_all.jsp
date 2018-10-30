<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css">
<title>WORKSPACE</title>
<style>
	td{
		text-align:center;
		padding: 1em;
	}
	td.wrap{
		text-align: left;
	}
	div{
		border-color: white;
		border-style: solid;
		border-width: 2px;
		margin: 50px 180px;
	}
	input[type=button]{
		padding: 0.5em;
		border:0;
		float: center;
		margin-right: 3em;
		background-color:  #f62217;
	}
	input[type=button]:hover{
		padding: 0.5em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
	#footer{
		margin: 0px;
		border:0px;
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
    	String name=(String)myResultSet.getObject(3);
    	String id=(String)myResultSet.getObject(1);
    	String memo=(String)myResultSet.getObject(9);
    	String job=(String)myResultSet.getObject(7);
    	String birth=(String)myResultSet.getObject(5);
    	String interest=(String)myResultSet.getObject(8);
    	String imgPath=(String)myResultSet.getObject(10);
    	%>
    	<div>
    	<table align="center">
    	<tr>
    		<td class="wrap" style="font-size:3em"><%=name%></td>
    		<td class="wrap" rowspan="5"><img src='<%=imgPath%>' width="306px"></td>
    	</tr>
		<tr>
			<td class="wrap"><a href="contact.jsp?id=<%=id%>"><%=id%></a></td>
		</tr>
		<tr>
			<td class="wrap"><%=job%></td>
		</tr>
		<tr>
			<td class="wrap" rowspan="2" height="10%"><%=memo%></td>
		</tr>
		<tr></tr>
    	</table>
    	</div>
    	
    	<div align="center" style="border:0px">
	    	<input type="button" value="Change Photo" onclick="location.href='changeImage.jsp'">
	    	<input type="button" value="MODIFY" onclick="location.href='modify1.jsp'">
	    </div>

    <%}
    else{
    	mySQL="select * from groupTable where id='"+session_id+"'";
    	myResultSet=stmt.executeQuery(mySQL);
    	if(myResultSet.next()){
    		String name=(String)myResultSet.getObject(3);
        	String id=(String)myResultSet.getObject(1);
        	String memo=(String)myResultSet.getObject(8);
        	String job=(String)myResultSet.getObject(6);
        	String birth=(String)myResultSet.getObject(4);
        	String field=(String)myResultSet.getObject(7);
        	String imgPath=(String)myResultSet.getObject(9);
        	%>
        	<div>
    		<table align="center">
    		<tr>
    			<td class="wrap" style="font-size:3em"><%=name%></td>
    			<td class="wrap" rowspan="5"><img src='<%=imgPath%>' width="306px"></td>
    		</tr>
			<tr>
				<td class="wrap"><a href="contact.jsp?id=<%=id%>"><%=id%></a></td>
			</tr>
			<tr>
				<td class="wrap"><%=job%></td>
			</tr>
			<tr>
				<td class="wrap" rowspan="2" height="10%"><%=memo%></td>
			</tr>
			<tr></tr>
    		</table>
    		</div>
    		<div align="center" style="border:0px">
	    	<input type="button" value="Change Photo" onclick="location.href='changeImage.jsp'">
	    	<input type="button" value="MODIFY" onclick="location.href='modify2.jsp'">
	    </div>
    	<%}
        stmt.close();
        myConn.close();
    }
%>
<div id="footer" style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>