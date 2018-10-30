<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_SCENARIO</title>
	
	<style>
		.m_scenario {
			background-color: #f62217; 
			}
		
		body {
			background-color: #333;
			}
		
		.pageTitle {
			color: #f62217;
			font-size: 40px;
			}
		
		.actorTable{
			background-color: #333;
			color: whilte;
		}
		
		img {
			margin: 5px;
			max-width: 100%;
			width: 400px;
			height: 500px;
		}
		
		span {
			margin-left: 7px;
			float: left;
		}
		
		.scenario_table{
			text-align: center;
			margin: 10px;
		}
	</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css">
	<h3 style="text-align: center"><div class="pageTitle"><br>SCENARIO</br></div></h3>
	<br>
	
	<table width="80%" align="center" cellpadding="2" cellspacing="0">
			<tr valign="top" style="background-color: #333;">
				<td ><input style="float: right; margin-bottom: 10px;" class="btn_notice_write" type="button"  value="WRITE" onclick="location.href='scenario_write.jsp'"></td>
			</tr>
			</table>
<%
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }

   int listSize = 6;
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
                        
	 String strSQL = "SELECT count(*) FROM scenario";
                        
	 ResultSet rs = stmt.executeQuery(strSQL);
                  
                        
	 if (rs.next())
                           
		 lastRow = rs.getInt(1);
                        
	 rs.close();
                        
                        
	 if (lastRow > 0) {
                           
		 strSQL = "SELECT * FROM scenario";
                            
		 rs = stmt.executeQuery(strSQL);
                            
		 row=0;
             %>
		 <table id="scenario_table" align="center" style="border-bottom: 2px #f62217" width="80%"><tr><%
		 while(rs.next()) {
                        	   
			 if(row<=startRow-2){ 
             
				 row++;
                 
			 }
             
			 else if(row<endRow){
					String title=(String)rs.getObject(2);
			    	String writer=(String)rs.getObject(3);
			    	int no=(int)rs.getObject(1);
				 %>
                      <td bgcolor="lightgrey" >
                      	<div width="50%" style="float:left; max-width: 100%; color: black">
                      	<a href="scenario_content.jsp?no=<%=no%>">
                      		<h1 style="color: black"><%=title%></h1>
                      		<%=writer%><br>
                      		</a>
                      	</div>
                      </td>
                      <%row++;
						if(row%2==0){%>
                                 </tr>
                        <%} 
            }
		 }
	 rs.close();
	 stmt.close();
 }
 
 else {%>
     
       	  <TR>
          <TD colspan="2">NO RECORD</TD>
          </TR>
          <%
    } 
}catch (SQLException ex) { 

	%>
    
                        <TR>
    
                           <TD colspan="2"> ERROR: <%=ex %> </TD>
    
                        </TR>
    
                        <%
    
}%>

                  </TABLE>

                  <br/>

                  

         		  <table align="center">

         		  <tr><td style="color:white">

<%                  
if (lastRow > 0) {

	int setPage = 1;
    
	
    
	int lastPage = 0;
    
	if (lastRow % listSize == 0)
    
		lastPage = lastRow / listSize;
        
	else
    
		lastPage = lastRow / listSize + 1;
        
	
    
	if (1 < currentPage) {
    
		%>
        
                         <a href="scenario.jsp?pageNum=<%=currentPage-1%>">◀</a>&nbsp;
        
                         <%
        
	}
    
	while (setPage <= lastPage) {
    
		
        
		if (setPage == currentPage) {
        
			%>[<%=setPage%>]<%
            
		}
        
		else {
        
			%>
            
                           &nbsp;<a href="scenario.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>&nbsp;
            
                           <%
            
		}
        
		setPage = setPage + 1;
        
	}
    
	if (lastPage > currentPage) {
    
		%>
        
                        &nbsp;<a href="scenario.jsp?pageNum=<%=currentPage+1%>">▶</a>
        
                        <%
        
	}
    
}%>

               </td></tr>

		</table>
		<div style=" float: left; width: 100%;">
	  	<br><br>
	   	<hr style="border: 2px solid #f62217"><br>
	  </div>
	  
   </section>
   
  <%@ include file="footer.jsp" %> 
</body>

</html>