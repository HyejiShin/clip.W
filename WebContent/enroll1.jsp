<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Enroll Individual</title>
<link rel="stylesheet" type="text/css" href="main_style.css" />

<script>
function PWD_CHECK(){
    if(document.form1.pwd.value!=document.form1.pwd_re.value){
        alert("Please check your password again");
        document.form1.pwd_re.value="";
        document.form1.pwd.value="";
        document.form1.pwd.focus();
    }
}

var maxChecked = 3;   //선택가능한 체크박스 갯수
var totalChecked = 0; // 설정 끝
function CountChecked(field) {
    if (field.checked)
        totalChecked += 1;
    else
        totalChecked -= 1;
    if (totalChecked > maxChecked) {
        alert ("Maximum is 3");
    field.checked = false;
    totalChecked -= 1;
    }
    
}
</script>
<style>
	*{
		text-align:center;
	}
	fieldset{
		margin: auto;
		margin-top: 10em;
		width: 40em;
		height: flex;
		border-color: #f62217;
		border-width: 0.2em;
		border-style: solid;
	}
	legend{ font-weight: bold; font-size: large; text-align:center; color: white}

	span.general{
		font-size: small;
		color: grey;
	}
	.submit{ 
		width: 10em;
		height: 2em; 
		color: white;
		background-color:#EB5050;
		cursor: pointer;
		font-size: large;
	}
	table{
		margin: auto;
	}
	td{
		vertical-align: top;
		text-align: left;
	}
	
	input[type=text], input[type=password], input[type=email], input[type=tel]
	{
		background-color: white;
		color: grey;
	}
	input[type=submit], input[type=button]{
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
	body{
		background-color: #333;
		color: white;
	}
</style>
</head>

<body>
<%@ include file="top.jsp" %>
<fieldset>
<legend align="center">Sign Up</legend>
<form name="form1" action="join_final.jsp" method="POST">
<table>
	<tr>
	<td>ID</td>
	<td><input type="email" id="userID" name="userID" placeholder="Put your e-mail address" maxLength="40" required></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Password</td><td><input type="password" id="pwd" name="pwd"  maxLength="20" required></td>
	<td style="text-align:right">Repeat Password&nbsp;&nbsp;</td>
	<td><input type="password" name="pwd_re" maxLength="20" required onBlur="PWD_CHECK()"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Name</td>
	<td><input type="text" name="name" maxLength="40" required></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Gender</td>
	<td><label>male <input type="radio" name="gender" value="male" checked required></label>
	&nbsp;&nbsp;
	<label>female <input type="radio" name="gender" value="female" required></label></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Birth</td>
	<td><input type="text" name="birth" pattern="\d{8}" placeholder="YYYY/MM/DD" required size="11"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Phone</td>
	<td><input type="tel" id="cel" name="cel" pattern="^\d{2,3}-\d{3,4}-\d{4}" placeholder="000-0000-0000형식" required size="16"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Position</td>
	<td>
		<select id="position" name="position" required>
			<option>선택하세요</option>
			<option>Student</option>
			<option>Expert</option>
			<option>Actor</option>
			<option>Others</option>
		</select>
	</td></tr>
		<tr>
		<tr><td>&nbsp;</td></tr>
	<td>Interests</td>
	<td colspan="3" style="font-size: small">
   		<table align="left">
   			<tr>
   				<td style="text-align:right">감독(연출) <INPUT name="director" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">연기자 <INPUT name="actor" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">영상(촬영) <INPUT name="film" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">편집 <INPUT name="edit" onclick=CountChecked(this) type=checkbox></td>
   			</tr>
   			<tr>
   				<td style="text-align:right">시나리오 <INPUT name="scenario" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">음향 <INPUT name="music" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">조명 <INPUT name="light" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">기획 <INPUT name="planning" onclick=CountChecked(this) type=checkbox></td>
   			</tr>
   			<tr>
   				<td style="text-align:right">홍보 <INPUT name="pr" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">평론 <INPUT name="evaluation" onclick=CountChecked(this) type=checkbox></td>
   				<td style="text-align:right">기타 <INPUT name="others" onclick=CountChecked(this) type=checkbox></td>
   			</tr>
   		</table>
	</td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Self introduction</td>
	<td colspan="3"><textarea name="intro" cols="50" rows="10" maxLength="300"></textarea></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br><input type="submit" class="submit" value="SUBMIT">
</form>
</fiedlset>
<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>