<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_SCENARIO_write</title>
	
	<style>
		.m_video {
			background-color: #f62217; 
			}
		
		body {
			background-color: #333;
			}
		
		.pageTitle {
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
		
		.btnPost{
			color: white;
			font-size: 15px;
			font-weight: 700;
			background-color: #f62217;
			border: 5px solid #f62217;
			padding: 7px;
		}
		a{
		text-decoration: none;
		color: white;
	}
	</style>
	<script language="javascript">
		function form_check(){
			if(!videoForm.title.value){
				alert("Title is empty");
				videoForm.title.focus();
				return false;
			}
			else if(!videoForm.content.value){
				alert("Content is empty");
				videoForm.content.focus();
				return false;
			}
			else if(!videoForm.url.value){
				alert("URL is empty");
				videoForm.url.focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css" />
	
	<h3 style="text-align: center"><div class="pageTitle"><br>VIDEO_POST</br></div></h3>
	
	<form enctype="multipart/form-data" name="videoForm" action="video_upload.jsp" onSubmit="return form_check();">
		<table align="center">
		
			<tr><td colspan="2"><hr style="border: 3px solid #f62217"></td></tr>
			
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" size="120" maxLength="100" autofocus></td>
			</tr>
			
			<tr>
				<th>URL</th>
				<td><input type="text" name="url" size="120" maxLength="1000" placeholder="write down your video URL..."></td>
			</tr>
		
			<tr><td colspan="2" ><hr style="border: 3px solid #f62217"></td></tr>
			
			<tr>
				<th>Content</th>
				<td><textarea type="text" name="content" cols="120" rows="30" maxLength="1000"></textarea>
			</tr>
			
			<tr><td colspan="2"><hr style="border: 3px solid #f62217;"></td></tr>
			
			<tr>
			<th>Extra</th>
				<td>
				<input type="email" name="extra1" size="120" placeholder="출연진의 아이디를 입력해주세요."><br>
				<input type="email" name="extra2" size="120" placeholder="출연진의 아이디를 입력해주세요."><br>
				<input type="email" name="extra3" size="120" placeholder="출연진의 아이디를 입력해주세요."><br>
				<input type="email" name="extra4" size="120" placeholder="출연진의 아이디를 입력해주세요."><br>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="2">
					<br>
					<a href="video.jsp"><input class="btnPost" type="submit" value="P O S T" ></a>
				</td>
			</tr>
			
			<tr><td colspan="2"><br><br><br></td></tr>
			
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