<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_NOTICE_content</title>
	<style>
		.m_scenario {
			background-color: #f62217; 
			}
		
		body {
			background-color: #333;
			}
		
		.page_title {
			color: lightgrey;
			font-size: 40px;
			}
		
		th {
			text-align: center; 
			background: lightgray 
			}
		
		hr {
			color: #f62217;
			}
		
		.btn_write_back{
			color: white;
			font-size: 15px;
			font-weight: 700;
			background-color: #f62217;
			border: 5px solid #f62217;
			padding: 7px;
		}
		
		.comment_title{
			color: #f62217;
			font-size: 30px;
		}
		
		.btn_comment{
			color: white;
			font-size: 15px;
			font-weight: 700;
			background-color: #f62217;
			border: 5px solid #f62217;
			padding: 5px;
			margin-left: 10px;
		}
		
		.comment_name{
			text-align: center;
			color: white;
			border: 3px solid #f62217;
			font-size: 15px;
			padding: 5px;
			margin-right: 10px;
		}
		#b{
			color: white;
			background-color: #333;
			border: 0px;
		}
	</style>
</head>
<body>
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="main_style.css" />
<h3 style="text-align: center;"><div class="page_title"><br>SCENARIO_CONTENT</br></div></h3>
 <table align="center">
 <%
                     Connection conn = null;      
                     Statement stmt  = null;
                     
                     String url = "jdbc:mysql://localhost:3306/mydb"; 
                     String dbuser = "root"; 
                     String dbpass = "admin";
                     
                     String num = request.getParameter("no");
					
                     try {
                        Class.forName("com.mysql.jdbc.Driver");            
                        conn=DriverManager.getConnection(url,dbuser,dbpass);
                  
                        stmt = conn.createStatement();
                        String strSQL = "SELECT * FROM scenario WHERE no="+num+"";
                        ResultSet rs = stmt.executeQuery(strSQL);

                        rs = stmt.executeQuery(strSQL);
                       while(rs.next()) {%>
							<tr><td colspan="4"><hr style="border: 3px solid #f62217"></td></tr>
			
							<tr>
								<th>Title</th>
								<td colspan="3"><input id="b" type="text" size="120" value="<%=rs.getString("title") %>"readonly></td>
							</tr>
			
							<tr float="left">
								<th>Writer</th>
								<td><input id="b" type="text" size="55" value="<%=rs.getString("writer")%>" readonly></td>
								<th>Date</th>
								<td><input id="b" type="text" size="55" value="<%=rs.getDate("uDate")%>" readonly></td>
							</tr> 
		
							<tr><td colspan="4"><hr style="border: 3px solid #f62217"></td></tr>
			
							<tr>
								<th>Content</th>
								<td colspan="3"><textarea cols="120" rows="30" readonly><%=rs.getString("content")%></textarea>
							</tr>
							<tr>
								<th>File</th>
								<td colspan="3"><a href="<%=rs.getString("filePath")%>" download><%=rs.getString("filePath")%></a></td>
							</tr>
					<%}
                       }catch (SQLException ex) { 
                        %>
                        <TR>
                           <TD colspan="4"> ERROR: <%=ex %> </TD>
                        </TR>
                        <%
                     }%>
					<tr><td colspan="4"><hr style="border: 3px solid #f62217"></td></tr>
</table>
<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>
</html>