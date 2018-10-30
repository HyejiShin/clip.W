<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css" />
<title>Manage</title>
<style>
#side ul li{
	width: 15%;
	position: relative;
	display: inline;
	margin: 2em;
	color: white;
}

a{
	text-decoration: none;
	color: white;
}

a:hover{
	color: #f62217;
}
span{
	 color: #f62217;
}
table{
	margin-top: 4em;
}
#cc{
	padding: 1em;
	text-align: center;
	border: 1px solid;
	color: white;
}
th{
	background: lightgrey;
	color: black;
}
</style>

</head>
<body style="background-color:#333">
<%@ include file="top.jsp" %>
<%
	if(!masterID.equals(session_id)){
		%>
        <script language=javascript>
        self.window.alert("접근할 수 없습니다. 로그인 후 이용해주세요.");
          location.href="login.jsp"; 
        </script>
     <%
	}
%>
<nav id="side">
<center>
<ul>
	<li><a href="admin.jsp" style="text-decoration: none;">Individual</a></li>
	<li><a href="admin2.jsp">Group</a></li>
	<li><a href="admin3.jsp"><span>Board</span></a></li>
</ul>
</center>
</nav>
<%
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }

   int listSize = 3;
   int currentPage = Integer.parseInt(pageNum);
   int nextPage = currentPage + 1;
   int startRow = (currentPage - 1) * listSize + 1;
   int endRow = currentPage * listSize;
   int lastRow = 0;
   int i = 0;
   int num[] = {0};
   int row = startRow;
   lastRow=endRow;
%>
<%
   String curuser = (String)session.getAttribute("user");
      if (masterID.equals(curuser)) {%>
         <script language=javascript>
         self.window.alert("접근할 수 없습니다. 로그인 후 이용해주세요.");
           location.href="login.jsp"; 
         </script>
      <%}
      else {%>
			<table align="center" width="80%">
			<thead class="table_firstline" align="center" bgcolor="lightgray" height="120%" >
				<th width="10%">NO.</th>
				<th width="50%">Title</th>
				<th width="20%">Writer</th>	
				<th width="20%">Date</th>
				<th width="10%">Delete</th>		
			</thead>
			 <%
                     Connection conn = null;      
                     Statement stmt  = null;
                     
                     String url = "jdbc:mysql://localhost:3306/mydb"; 
                     String dbuser = "root"; 
                     String dbpass = "admin";
                     
                     try {
                        Class.forName("com.mysql.jdbc.Driver");            
                        conn=DriverManager.getConnection(url,dbuser,dbpass);
                  
                        stmt = conn.createStatement();
                        String strSQL = "SELECT count(*) FROM notice";
                        ResultSet rs = stmt.executeQuery(strSQL);
                  
                        if (rs.next())
                           lastRow = rs.getInt(1);
                        rs.close();
                        
                        if (lastRow > 0) {
                           strSQL = "SELECT * FROM notice";
                            rs = stmt.executeQuery(strSQL);
                            row=0;
                           while(rs.next()) {
                        	   if(row<=startRow-2){ 
                        		   row++;
                        	   }
                        	   else if(row<endRow){
                        	   %>
                                 <TR>
                                    <td id="cc"><%=rs.getInt("no") %></td>
                          		  	<td id="cc">
                          		  	<a href='notice_content.jsp?no=<%=rs.getInt("no")%>'>
                          		  	<%=rs.getString("title") %>
                          		  	</a>
                          		  	</td>
                         		   	<td id="cc"><%=rs.getString("writer")%></td>
                            		<td id="cc"><%=rs.getDate("uDate") %></td>
                            		<td id="cc"><a href='delete_notice.jsp?no=<%=rs.getInt("no")%>'>delete</a></td>
                                 </TR>
                                 <%row++;
                        	   }
                        	}
                        }
                        else {
                           %>
                           <TR>
                              <TD colspan="4" id="cc">NO RECORD</TD>
                           </TR>
                           <%
                        } 
                        rs.close();
                        stmt.close();

                     }
                     catch (SQLException ex) { 
                        %>
                        <TR>
                           <TD colspan="4" id="cc"> ERROR: <%=ex %> </TD>
                        </TR>
                        <%
                     }%>
                  </TABLE><br/>
                  
         		  <table align="center">
         		  <tr><td style="color:white">
<%                  if (lastRow > 0) {
                     int setPage = 1;
                     
                     int lastPage = 0;
                     if (lastRow % listSize == 0)
                        lastPage = lastRow / listSize;
                     else
                        lastPage = lastRow / listSize + 1;
                        
                     if (1 < currentPage) {
                         %>
                         <a href="admin3.jsp?pageNum=<%=currentPage-1%>">◀</a>&nbsp;
                         <%
                      }
                     while (setPage <= lastPage) {
                    	 
                    	if (setPage == currentPage) {
                           %><span>[<%=setPage%>]</span><%
                        }
                        else {
                           %>
                           &nbsp;<a href="admin3.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>&nbsp;
                           <%
                        }
                        setPage = setPage + 1;
                     }
                     if (lastPage > currentPage) {
                        %>
                        &nbsp;<a href="admin3.jsp?pageNum=<%=currentPage+1%>">▶</a>
                        <%
                     }
               }
               }%>
               </td></tr>
		</table>
	 <div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	<%@ include file="footer.jsp" %> 
   </body>
   </html>