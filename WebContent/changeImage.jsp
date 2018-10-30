<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css">
<title>Change Photo</title>
<style>
body{
	background-color:#333;
	}
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
	input[type=submit]{
		padding: 0.5em;
		border:0px;
		float: center;
		margin-right: 3em;
		background-color:  #f62217;
	}
	input[type=submit]:hover{
		padding: 0.5em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
	#footer{
		border:0px;
		margin:0px;
	}
</style>
</head>

<body>
<%@ include file="top.jsp" %>
<table align="center" width="40%" style="margin-top: 100px">
	<tr>
		<td><a href="personal.jsp"><img src="images/home2.png" width="50px"></a></td>
		<td><a href="main.jsp"><img src="images/file.png" width="50px"></a></td>
		<td><a href="contact.jsp"><img src="images/mail.png" width="50x"></a></td>
	</tr>
</table>
<form name="img" enctype="multipart/form-data" action="write_ok.jsp" method="POST">
    	<div>
    	<table align="center">
    	<tr>
         <th>REGISTER</th>
         <td style="text-align: left"><input type="file" name="filename"></td>
      	</tr>
		<tr></tr>
    	</table>
    	</div>
<div align="center" style="border:0px"><input type="submit" value="COMMIT"></div>
</form>
<div id="footer" style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>