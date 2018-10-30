<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			
<%
request.setCharacterEncoding("UTF-8");
Connection conn = null;
Statement stmt  = null;
String url = "jdbc:mysql://localhost:3306/mydb";  
String dbuser = "root";                                       
String dbpass = "admin"; 
Class.forName("com.mysql.jdbc.Driver");            

	String del_id = request.getParameter("del_id");
	try{
				
		conn=DriverManager.getConnection(url,dbuser,dbpass);

		stmt = conn.createStatement();
		String sql = "DELETE FROM member WHERE id='"+ del_id+"'";	
		stmt.executeUpdate(sql);
		
		sql = "DELETE FROM groupTable WHERE id='"+ del_id+"'";	
		stmt.executeUpdate(sql);
%>
  			<script language=javascript>
   				self.window.alert("Delete Success!");
   				history.back(-2);
  			</script>
<%
		stmt.close();
		conn.close();
		
		 
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>