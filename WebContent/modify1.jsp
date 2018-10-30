<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css">
<title>modify your information</title>
<style>
	td{
		text-align:center;
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
		padding: 1em;
		border:0;
		float: right;
		margin-right: 13em;
		background-color:  #f62217;
	}
	input[type=button]:hover{
		padding: 1em;
		border:0;
		align: center;
		color:  #f62217;
		background-color: black;
	}
	*{
		text-align:center;
	}

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
		color: black;
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
	#footer{
		border:0px;
		margin: 0px;
	}
</style>
<script>
function PWD_CHECK(){
    if(document.modify_form.pwd.value!=document.modify_form.pwd_re.value){
        alert("비밀번호가 일치하지 않습니다!");
        document.modify_form.pwd_re.value="";
        document.modify_form.pwd.value="";
        document.modify_form.pwd.focus();
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
        alert ("최대 3개 까지만 가능합니다.");
    field.checked = false;
    totalChecked -= 1;
    }
    
}
</script>
</head>
<body>
<%@ include file="top.jsp" %>
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
    	String id=(String)myResultSet.getObject(1);
    	String pw=(String)myResultSet.getObject(2);
    	String name=(String)myResultSet.getObject(3);
    	String gender=(String)myResultSet.getObject(4);
    	String birth=(String)myResultSet.getObject(5);
    	String phone=(String)myResultSet.getObject(6);
    	String job=(String)myResultSet.getObject(7);
    	String interest=(String)myResultSet.getObject(8);
    	String self_intro=(String)myResultSet.getObject(9);
    	String imgPath=(String)myResultSet.getObject(10);
%>
<fieldset>
<legend align="center">Modify</legend>
<form name="modify_form" action="modify_final.jsp" method="POST">
<table>
	<tr>
	<td>ID</td>
	<td><input type="email" id="userID" name="userID" value=<%=id%> readonly maxLength="40" required></td>
	<td></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Password</td><td><input type="password" id="pwd" name="pwd" maxLength="20" required></td>
	<td style="text-align:right">Repeat Password&nbsp;&nbsp;</td>
	<td><input type="password" name="pwd_re" required maxLength="20" onBlur="PWD_CHECK()"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Name</td>
	<td><input type="text" name="name" value=<%=name%> maxLength="40" required></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Gender</td>
	<td><label>male <input type="radio" name="gender" value="male" <%if(gender.equals("male")){%>checked<%} %>  required></label>
	&nbsp;&nbsp;
	<label>female <input type="radio" name="gender" value="female" <%if(gender.equals("female")){%>checked<%} %> required></label></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Birth</td>
	<td><input type="text" name="birth" pattern="\d{8}" value=<%=birth %> readonly required size="11"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Phone</td>
	<td><input type="tel" id="cel" name="cel" pattern="^\d{2,3}-\d{3,4}-\d{4}" value="<%=phone%>" required size="16"></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
	<tr>
	<td>Position</td>
	<td>
		<select id="position" name="position" required>
			<option>선택하세요</option>
			<option value="Student" <%if(job.equals("Student")){%>selected<%}%>>Student</option>
			<option value="Expert" <%if(job.equals("Expert")){%>selected<%}%>>Expert</option>
			<option value="Actor" <%if(job.equals("Actor")){%>selected<%}%>>Actor</option>
			<option value="Others" <%if(job.equals("Others")){%>selected<%}%>>Others</option>
		</select>
	</td></tr>
		<tr>
		<tr><td>&nbsp;</td></tr>
	<td>Interests or Job</td>
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
	<td>Self introduction</td>
	<td colspan="3"><textarea name="intro" cols="50%" rows="10" maxLength="300"><%=self_intro%></textarea></td>
	</tr>
	<tr><td>&nbsp;</td></tr>
</table>
<br><input type="submit" class="submit" value="COMMIT">
</form>
</fiedlset>
<%} %>
<div id="footer" style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>