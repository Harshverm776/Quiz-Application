<%-- 
    Document   : forgot_val
    Created on : Apr 4, 2019, 7:26:39 PM
    Author     : Harsh
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="utility.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
 try
 {
    String email =request.getParameter("email");
    String security_code =request.getParameter("security_code");
    ResultSet rs=SqlUtil.retrieve("select password from user where mail='"+email+"' and security_code='"+security_code+"'"); 
    if(rs.next()==true)
    {
        String pass=rs.getString("password");
        request.setAttribute("Message","Your password : "+pass);
        RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
        rd.forward(request, response);
    }
    else{
        request.setAttribute("Message","E-mail or Security code Incorrect.");
        RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
        rd.forward(request, response);
    }
 }
catch(Exception ex)
{
    request.setAttribute("Message","Try Again");
    RequestDispatcher rd=request.getRequestDispatcher("Forgot_password.jsp");
    rd.forward(request, response);
    System.out.println(""+ex);
}
%>