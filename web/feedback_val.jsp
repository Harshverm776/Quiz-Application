<%-- 
    Document   : feedback
    Created on : Mar 25, 2019, 4:51:19 PM
    Author     : Harsh
--%>

<%@page import="utility.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
 try
 {
    String subject =request.getParameter("subject");
    String feedback =request.getParameter("feedback");
    SqlUtil.update("create table if not exists feedback(mail varchar(50) not null,date_time timestamp not null default current_timestamp,subject varchar(200) not null,feedback_d varchar(500) not null);");
    SqlUtil.update("insert into feedback(mail,subject,feedback_d) values('"+SqlUtil.mail+"','"+subject+"','"+feedback+"')");
    request.setAttribute("Message","Thanks for Your Feedback");
    RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
    rd.forward(request, response);
 }
catch(Exception ex)
{
    request.setAttribute("Message","Try Again");
    RequestDispatcher rd=request.getRequestDispatcher("feedback.jsp");
    rd.forward(request, response);
    System.out.println(""+ex);
}
%>