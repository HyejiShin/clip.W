<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Individual member delete</title>
<%
	String id = request.getParameter("id");
%>
<script language="JavaScript">
function myconfirm(){ 
	if (confirm("Really delete?")){ 
		location.href="delete_ok.jsp?del_id=<%=id%>";
	}
	else{
	  		history.back();
	} 
} 
</script>
</head>

<body>
<script language="JavaScript">
myconfirm();
</script>
</body>
</html>