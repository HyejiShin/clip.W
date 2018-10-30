<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>w.clip_SCENARIO_write</title>
<style>
	.m_scenario {
		background-color: #f62217; 
		}
	
	body {
		background-color: #333;
		}
	
	.page_title {
		color: #f62217;
		font-size: 40px;
		}
	
	th {
		text-align: center; 
		background: lightgray 
		}
	
	hr {
		color: #f62217;
		}
	
	
	.btn_write_post{
		color: white;
		font-size: 15px;
		font-weight: 700;
		background-color: #f62217;
		border: 5px solid #f62217;
		padding: 7px;
	}
</style>
</head>

<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css" />
	<%
   String curuser = (String)session.getAttribute("user");
      if (curuser==null) {%>
         <script language=javascript>
         self.window.alert("접근할 수 없습니다. 로그인 후 이용해주세요.");
           location.href="login.jsp"; 
         </script>
      <%}
      else {%>
	
	<script language="javascript">
		function form_check(){
			if(!writeform.title.value){
				alert("Title is empty");
				writeform.title.focus();
				return false
			}
			else if(!writeform.content.value){
				alert("Content is empty");
				writeform.content.focus();
				return false;
			}
			return true;
		}
	</script>
	
	<h3 style="text-align: center"><div class="page_title"><br>SCENARIO_POST</br></div></h3>
	
	<form enctype="multipart/form-data" method="POST" name="write_form" action="scenario_ok.jsp" onSubmit="return form_check()">
		<table align="center">
		
			<tr><td colspan="2"><hr style="border: 3px solid #f62217"></td></tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" size="120" autofocus maxLength="100"></td>
			</tr>
						
			<tr>
				<th>File</th>
				<td><input type="file" name="filename"></td>
			</tr>
		
			<tr><td colspan="2" ><hr style="border: 3px solid #f62217"></td></tr>
			
			<tr>
				<th>Content</th>
				<td><textarea type="text" name="content" cols="120" rows="30" maxLength="1000"></textarea>
			</tr>
			
			<tr><td colspan="2"><hr style="border: 3px solid #f62217;"></td></tr>
			
			<tr align="center">
				<td colspan="2">
					<br>
					<input class="btn_write_post" type="submit" value="POST" >
				</td>
			</tr>
		
		</table>
	</form>
	<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
<%}
      %>
</html>