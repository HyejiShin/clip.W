<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<%
request.setCharacterEncoding("UTF-8");
 
String from = "clip_w@naver.com";
String user = session_id;
String to = request.getParameter("to");
String subject = request.getParameter("subject");
String content = request.getParameter("message");
 
Properties p = new Properties(); 
 
p.put("mail.smtp.host","smtp.naver.com"); 
 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
 
try{
    Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); 
    msg.setSubject(subject);
     
    Address fromAddr = new InternetAddress(from);
    msg.setFrom(fromAddr);
     
    Address toAddr = new InternetAddress(to);
    msg.addRecipient(Message.RecipientType.TO, toAddr); 
     
    content=user+" send mail to you.<br><hr><br>"+content;
    msg.setContent(content, "text/html;charset=UTF-8");
     
    Transport.send(msg); 
} catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Send Mail Fail...');history.back();</script>");
    return;
}
 
out.println("<script>alert('Send Mail Success');location.href='contact.jsp';</script>");
%>