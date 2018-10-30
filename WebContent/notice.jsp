<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="main_style.css" />
<title>w.clip_NOTICE</title>
<style>
	.m_notice {
		background-color: #f62217; 
		}
	
	body {
		background-color: #333;
		}
	
	.page_title {
		color: white;
		font-size: 40px;
		}
		
	.btn_notice_write{
		float: left;
		color: white;
		font-size: 15px;
		font-weight: 700;
		background-color: #f62217;
		border: 5px solid #f62217;
		padding: 5px;
	}
	td{
		color: black;
	}
	
	table_firstline{
			font-weight: 700;
	}
	#cc{
		background-color: white;
		border: 1px solid;
		text-align: center;
	}
	
	span{
		color: #f62217;
	}
</style>
</head>

<body>
	<%@ include file="top.jsp" %> 
	<h3 style="text-align: center"><div class="page_title"><br>NOTICE</br></div></h3>
	<br><br>
	<%
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }

   int listSize = 10;
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

	<form name="notice_form">
		<table class="notice_table"  width="80%" align="center" cellpadding="2" cellspacing="0">
			<tr valign="top" style="background-color: #333;">
				<td style="padding-top: 13px;" colspan="4" align="left">
					
				</td>
				
				<td ><input style="float: right; margin-bottom: 10px;" class="btn_notice_write" type="button" value="WRITE" onclick="location.href='notice_write.jsp'"></td>
			</tr>
			</table>
			<table align="center" width="80%">
			<tr class="table_firstline" align="center" bgcolor="lightgray" height="120%" >
				<td width="10%">NO.</td>
				<td width="60%">Title</td>
				<td width="20%">Writer</td>	
				<td width="20%">Date</td>		
			</tr>
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
                          		  	<a href='notice_content.jsp?no=<%=rs.getInt("no")%>' style="text-decoration: none; color: black;">
                          		  	<%if(master.equals(rs.getString("writer"))){%>
                          		  			<b style="color: #f62217;"><%=rs.getString("title") %></b>
                          		  	<%}
                          		  	else{ %>
                          		  		<%=rs.getString("title") %>
                          		  	<%}
                          		  	%>
                          		  	</a>
                          		  	</td>
                         		   	<td id="cc"><%=rs.getString("writer")%></td>
                            		<td id="cc"><%=rs.getDate("uDate") %></td>
                                 </TR>
                                 <%row++;
                        	   }
                              }
                           //}
                           //rs.close();
                           //stmt.close();
                        }
                        else {
                           %>
                           <TR>
                              <TD colspan="4">NO RECORD</TD>
                           </TR>
                           <%
                        } 
                        rs.close();
                        stmt.close();

                     }
                     catch (SQLException ex) { 
                        %>
                        <TR>
                           <TD colspan="4"> ERROR: <%=ex %> </TD>
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
                         <a href="notice.jsp?pageNum=<%=currentPage-1%>">◀</a>&nbsp;
                         <%
                      }
                     while (setPage <= lastPage) {
                    	 
                    	if (setPage == currentPage) {
                           %><span>[<%=setPage%>]</span><%
                        }
                        else {
                           %>
                           &nbsp;<a href="notice.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>&nbsp;
                           <%
                        }
                        setPage = setPage + 1;
                     }
                     if (lastPage > currentPage) {
                        %>
                        &nbsp;<a href="notice.jsp?pageNum=<%=currentPage+1%>">▶</a>
                        <%
                     }
               }%>
               </td></tr>
		</table>
	</form>
	 <div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	<%@ include file="footer.jsp" %> 
</body>
</html>