<%@ page contentType="text/html; charset=UTF-8" %>
 <% session.invalidate(); %>
 <script>
   alert("LOG OUT");
   location.href="main.jsp";
 </script>