<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>w.clip_COMPANY</title>
	
	<style>
		.m_company {
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
			color: #f62217;
		}
	</style>
</head>
<body>
	<%@ include file="top.jsp" %>
	<link rel="stylesheet" type="text/css" href="main_style.css">
	<h3 style="text-align: center"><div class="pageTitle"><br>COMPANY</br></div></h3>
	<br>
<%
   String pageNum = request.getParameter("pageNum");
   if (pageNum == null) {
      pageNum = "1";
   }

   int listSize = 9;
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
                        
	 String strSQL = "SELECT count(*) FROM groupTable WHERE job='Company'";
                        
	 ResultSet rs = stmt.executeQuery(strSQL);
                  
                        
	 if (rs.next())
                           
		 lastRow = rs.getInt(1);
                        
	 rs.close();
                        
                        
	 if (lastRow > 0) {
                           
		 strSQL = "SELECT * FROM groupTable WHERE job='Company'";
                            
		 rs = stmt.executeQuery(strSQL);
                            
		 row=0;
             %>
		 <table align="center"><tr><%
		 while(rs.next()) {
                        	   
			 if(row<=startRow-2){ 
             
				 row++;
                 
			 }
             
			 else if(row<endRow){
					String name=(String)rs.getObject(3);
			    	String idx=(String)rs.getObject(1);
			    	String imgPath=(String)rs.getObject(9);
				 %>
                      <td onclick="location.href='personal.jsp?id=<%=idx%>'">
                      <img src="<%=imgPath%>"></td>
                      </td>
                      <%row++;
						if(row%3==0){%>
                                 </tr>
                        <%} 
            }
		 }
	 rs.close();
	 stmt.close();
 }
 
 else {%>
     
       	  <TR>
          <TD colspan="3">NO RECORD</TD>
          </TR>
          <%
    } 
}catch (SQLException ex) { 

	%>
    
                        <TR>
    
                           <TD colspan="3"> ERROR: <%=ex %> </TD>
    
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
        
                         <a href="company.jsp?pageNum=<%=currentPage-1%>">◀</a>&nbsp;
        
                         <%
        
	}
    
	while (setPage <= lastPage) {
    
		
        
		if (setPage == currentPage) {
        
			%><span>[<%=setPage%>]</span><%
            
		}
        
		else {
        
			%>
            
                           &nbsp;<a href="company.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>&nbsp;
            
                           <%
            
		}
        
		setPage = setPage + 1;
        
	}
    
	if (lastPage > currentPage) {
    
		%>
        
                        &nbsp;<a href="company.jsp?pageNum=<%=currentPage+1%>">▶</a>
        
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