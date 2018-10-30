<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="top.jsp" %>
<link rel="stylesheet" type="text/css" href="main_style.css" />
<%
      if (session_id==null) {%>
         <script language=javascript>
         self.window.alert("접근할 수 없습니다. 로그인 후 이용해주세요.");
           location.href="login.jsp"; 
         </script>
      <%}
      else{
	String extra[] = new String[4];

	extra[0]=request.getParameter("extra1");
	extra[1]=request.getParameter("extra2");
	extra[2]=request.getParameter("extra3");
	extra[3]=request.getParameter("extra4");

try{
	Connection myConn = null;
	Statement stmt = null;	
	String mySQL = null;

	String dburl  = "jdbc:mysql://localhost:3306/mydb";
	String user="root";
	String passwd="admin";
	String driver = "com.mysql.jdbc.Driver";

	Date time=new Date();
  	
	String formTitle = request.getParameter("title");
	String formContent = request.getParameter("content");
	String formURL = request.getParameter("url");
	
  	Class.forName(driver);	
  	myConn= DriverManager.getConnection(dburl, user, passwd);

  	mySQL = "INSERT INTO video(title,writer,src,content,uDate) VALUES (?,?,?,?,?)";
    PreparedStatement pstmt = myConn.prepareStatement(mySQL);
  	
  	pstmt=myConn.prepareStatement(mySQL);
	pstmt.setString(1, formTitle);
	pstmt.setString(2, session_name);
	pstmt.setString(3, formURL);
	pstmt.setString(4, formContent);
	pstmt.setDate(5, new java.sql.Date(time.getTime()));
	pstmt.executeUpdate();

    //pstmt.close();
    //stmt.close();
    //myConn.close();
    
    	mySQL= "insert into extra(e1,e2,e3,e4) values(?,?,?,?)";
    	pstmt=myConn.prepareStatement(mySQL);
    	pstmt.setString(1,extra[0]);
    	pstmt.setString(2,extra[1]);
    	pstmt.setString(3,extra[2]);
    	pstmt.setString(4,extra[3]);
    	pstmt.executeUpdate();
	}catch(Exception e){
	out.println(e.toString());
	}%><script>
		alert("COMMIT WRITE!");
		location.href='video.jsp';
	</script>
	<%}%>