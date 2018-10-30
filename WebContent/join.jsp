<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JOIN</title>
<link rel="stylesheet" type="text/css" href="main_style.css" />
<style>
	*{
		text-align:center;
		background-color: #333;
		color:white;
	}
	fieldset{
		margin: auto;
		margin-top: 10em;
		width: 11em;
		height: flex;
		border-color: lightgrey;
		border-width: 0.2em;
		border-style: solid;
		padding: 2em;
	}
	legend{ font-weight: bold; font-size: large; text-align: center;}
	.next{
		width: 10em;
		font-size: large; 
		color: white;
		background-color:#f62217;
		cursor: pointer;
	}
	input[type=button]{
		padding: 0.5em;
		border:0;
		align: center;
		background-color:  #f62217;
	}
	input[type=button]:hover{
		padding: 0.5em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
</style>
</head>
<body>
<%@ include file="top.jsp" %> 

<fieldset>
<legend align="center">Join As</legend>
<table>
<tr><td>
<input type="button" class="next" value="Individual" onclick="location.href='enroll1.jsp'"></td>
</tr>
<tr></tr>
<tr>
<td>
<input type="button" class="next" value="Group" onclick="location.href='enroll2.jsp'"></td>
</tr>
</table>
</fieldset>
<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>