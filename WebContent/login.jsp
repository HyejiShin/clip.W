<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LOG IN</title>

<link rel="stylesheet" type="text/css" href="main_style.css" />
<style>
	*{
		text-align:center;
		background-color:#333;
		color: white; 
	}
	fieldset{
		margin: auto;
		margin-top: 10em;
		width: 15em;
		height: flex;
		border-color: lightgrey;
		border-width: 0.2em;
		border-style: solid;
	}
	legend{ font-weight: bold; font-size: large;}
	span.link{
		font-weight: bold;
		color: #f62217;
		cursor: pointer;
	}
		input[type=submit]{
		padding: 0.5em;
		border:0;
		align: center;
		background-color:  #f62217;
	}
	
	input[type=submit]:hover{
		padding: 0.5em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
	span.general{
		font-size: small;
		color: white;
	}
	.login{ 
		width: 10em;
		height: 2em; 
		font-size: large; 
		color: white;
		background-color:#f62217;
		cursor: pointer;	
	}
	input[type=text], input[type=password]{
		background-color: white;
		color: grey;	
	}
</style>
</head>

<body>
<%@ include file="top.jsp" %> 
<form action="login_verify.jsp" method="POST" name="loginForm">
<fieldset>
<legend align="center">Log into clip.W</legend>
<pre>
ID : <input type="text" name="userID" placeholder="E-mail">

PW : <input type="password" name="userPassword" placeholder="Password"><br>

<input type="submit" value="LOG IN" class="login">
</pre>
<span class="general">New to clip.W ?</span>&nbsp;&nbsp;&nbsp;
<span class="link" onclick="location.href='join.jsp'">Join Now</span>
</fieldset>
</form>
<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>