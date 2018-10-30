<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_VIDEO_content</title>
	<style>
		.m_video{
			background-color: #f62217; 
		}
		
		body {
			background-color: #333;
		}
		
		.page_title {
			color: #f62217;
			font-size: 40px;
		}
		
		.video_actor_table{
			color: white;
			text-align: center;
			font-size: 20px;
		}
			
	</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css" />
	
	<h3 style="text-align: center"><div class="page_title"><br>VIDEO_CONTENT</br></div></h3>
	<br>
<% 
	Connection conn = null;      
   Statement stmt  = null;
   
   String url = "jdbc:mysql://localhost:3306/mydb"; 
   String dbuser = "root"; 
   String dbpass = "admin";
   String no = request.getParameter("no");

      Class.forName("com.mysql.jdbc.Driver");            
      conn=DriverManager.getConnection(url,dbuser,dbpass);

      stmt = conn.createStatement();
      String sql="SELECT * FROM video WHERE no="+no+"";
      ResultSet rs = stmt.executeQuery(sql); 
      if(rs.next()){ %>
      <form name="video_content_form">
		<table class="video_content_table" width="80%" align="center" cellpadding="2" cellspacing="0">
			<tr>
				<td>
					<p align="middle">
					<%=rs.getString("src") %>
					</p>
				</td>
			</tr>
			
			<tr>
			<td><h1>제목: <%=rs.getString("title") %></h1></td>
			</tr>
			<tr>
				<td>작성자: <%=rs.getString("writer")%></td>
			</tr>
			<tr>
				<td><%=rs.getString("content") %></td>
			</tr>
		</table>
		<br><br><br>
	</form>
	<%stmt.close();
	  rs.close();
      }
	%>
	
	<form name="video_extra">
		<table class="video_actor_table" width="80%" align="center" cellpadding="2" cellspacing="0">
			
			<tr><td colspan="4" ><div style="float:left; color: #f62217; font-size: 30px">Extras</div></tr>
			<tr><td colspan="4" bgcolor="#333"><hr style="border: 2px solid #f62217"></td></tr>
			
			<tr>
			<%
			stmt = conn.createStatement();
      		sql="SELECT * FROM extra WHERE no="+no+"";
      		rs = stmt.executeQuery(sql); 
      		if(rs.next()){
      		%>
				<td>
					<div width="25%">
						<p><img src="images/actor1.jpg" style="max-width: 100%; width: 270px; height: 350px;"></p>
						<p><%=rs.getString("e1") %></p>
					</div>
				</td>
				<td>
					<div width="25%">
						<p><img src="images/actor2.jpg" style="max-width: 100%; width: 270px; height: 350px;"></p>
						<p><%=rs.getString("e2") %></p>
					</div>
				</td>
				<td>
					<div width="25%">
						<p><img src="images/actor3.jpg" style="max-width: 100%; width: 270px; height: 350px;"></p>
						<p><%=rs.getString("e3") %></p>
					</div>
				</td>
				<td>
					<div width="25%">
						<p><img src="images/actor4.jpg" style="max-width: 100%; width: 270px; height: 350px;"></p>
						<p><%=rs.getString("e4") %></p>
					</div>
				</td>
			</tr>
			
			<tr><td colspan="4" bgcolor="#333"><hr style="border: 2px solid #f62217"></td></tr>
			<%} %>
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