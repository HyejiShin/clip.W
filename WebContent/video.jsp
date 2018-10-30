<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_VIDEO</title>
	
	<style>
		.m_video {
			background-color: #f62217; 
			}
		
		body {
			background-color: #333;
			}
		
		.page_title {
			color: #f62217;
			font-size: 40px;
			}
			
		.btn_video_write{
			float: left;
			color: white;
			font-size: 15px;
			font-weight: 700;
			background-color: #f62217;
			border: 5px solid #f62217;
			padding: 5px;
		}
		
		span{
	 color: #f62217;
}
		.in_video_table{
			background-color: #333;
			color: whilte;
		}
		
		.video_title{
			padding-left: 20px;
			valign: top;
			font-size: 33px;
			font-weight: 700;
			color: #f62217;
			height: 10%;
		}
		
		.video_writer{
			padding-left: 20px;
			font-size: 20px;
			font-weight: 700;
			color: #fefcff;
			height: 10%;
		}
		
		.video_date{
			padding-left: 20px;
			font-size: 20px;
			font-weight: 700;
			color: #fefcff;
			height: 10%;
		}
		
		.video_genre{
			padding-left: 20px;
			font-size: 20px;
			font-weight: 700;
			color: #fefcff;
			height: 10%;
		}
		
		.video_content{
			padding-left: 20px;
			font-size: 20px;
			font-weight: 700;
			color: #fefcff;
			height: 10%;
		}
		a{
			text-decoration: none;
			color: white;
		}
	</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css" />
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
   
   Connection conn = null;      
   Statement stmt  = null;
   
   String url = "jdbc:mysql://localhost:3306/mydb"; 
   String dbuser = "root"; 
   String dbpass = "admin";
   
   try {
      Class.forName("com.mysql.jdbc.Driver");            
      conn=DriverManager.getConnection(url,dbuser,dbpass);

      stmt = conn.createStatement();
      String strSQL = "SELECT count(*) FROM video";
      ResultSet rs = stmt.executeQuery(strSQL);
%>
	<h3 style="text-align: center"><div class="page_title"><br>VIDEO<br></div></h3>
	<br>
	<table class="video_table" width="80%" align="center" cellpadding="2" cellspacing="0">
			<tr valign="top" bgcolor="#333" >
				<td colspan="2"><a href="video_write.jsp"><input style="float: right; margin-bottom: 10px;" class="btn_video_write" type="button" value="WRITE"></a></td>
			</tr>
			<tr><td colspan="2" bgcolor="#333"><hr style="border: 3px solid #f62217"></td></tr>
<%
      
      if (rs.next())
         lastRow = rs.getInt(1);
      rs.close();
      
      if (lastRow > 0) {
         strSQL = "SELECT * FROM video";
          rs = stmt.executeQuery(strSQL);
          row=0;
         while(rs.next()) {
      	   if(row<=startRow-2){ 
      		   row++;
      	   }
      	   else if(row<endRow){
      		   %>
			<tr>
				<td width="60%">
					<%=rs.getString("src") %>
				</td>
				<td width="40%" class="in_video_table" >
					<div class="video_title" name="video_title">
						<a href="video_content.jsp?no=<%=rs.getInt("no")%>"><%=rs.getString("title")%></a>
					</div><br>
					<div><span class="video_writer" name="video_writer"><%=rs.getString("writer")%></span></div>
					&nbsp;&nbsp;
					<div><span class="video_date" name="video_date"><%=rs.getDate("uDate") %></span></div>
				</td>
			<tr>
			<%row++;
			}
		}
      }
         else{
		%>
			<tr><td colspan="2">NO RECORD</td></tr>
			<%
			}
         rs.close();
         stmt.close();
      }
      catch(Exception e){
    	  %>
    	  <Tr>
    	  	<td colspan="2">ERROR:<%=e %>
    	  </Tr>
    	  <%
      }%>
		</table><br>

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
                         <a href="video.jsp?pageNum=<%=currentPage-1%>">◀</a>&nbsp;
                         <%
                      }
                     while (setPage <= lastPage) {
                    	 
                    	if (setPage == currentPage) {
                           %><span>[<%=setPage%>]</span><%
                        }
                        else {
                           %>
                           &nbsp;<a href="video.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>&nbsp;
                           <%
                        }
                        setPage = setPage + 1;
                     }
                     if (lastPage > currentPage) {
                        %>
                        &nbsp;<a href="video.jsp?pageNum=<%=currentPage+1%>">▶</a>
                        <%
                     }
               }
               %>
               </td></tr>
		</table>
	 <div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	<%@ include file="footer.jsp" %> 
	
   </body>
   </html>