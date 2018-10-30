<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_write</title>
	
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
		
		.btn_scenario_post{
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
	
	<h3 style="text-align: center"><div class="page_title"><br>WRITE</br></div></h3>
	
	<form enctype="multipart/form-data" name="scenario_write_form" method=POST action="scenario.jsp" onSubmit="return form_check()">
		<table align="center">
		
			<tr><td colspan="2"><hr style="border: 3px solid #f62217"></td></tr>
			
			<tr>
				<th>Title</th>
				<td><input type="text" name="scenario_write_title" size="120" autofocus></td>
			</tr>
			
			<tr>
				<th>File</th>
				<td><input type="file" name="scenario_write_filename"></td>
			</tr>
		
			<tr><td colspan="2" ><hr style="border: 3px solid #f62217"></td></tr>
			
			<tr>
				<th>Content</th>
				<td><textarea type="text" name="scenario_write_content" cols="120" rows="30"></textarea>
			</tr>
			
			<tr><td colspan="2"><hr style="border: 3px solid #f62217;"></td></tr>
			
			<tr align="center">
				<td colspan="2">
					<br>
					<a href="scenario.jsp"><input class="btn_scenario_post" type="submit" href="scenario.jsp" value="P O S T" ></a>
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
</html>