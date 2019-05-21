<%-- 
    Document   : login_val
    Created on : Mar 28, 2019, 6:54:45 AM
    Author     : Harsh
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utility.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try
{
    String mail=request.getParameter("mail");
    String password=request.getParameter("psw");
    if(mail.equals("dmishra2309@gmail.com") && (password.equals("2301")))
            {
              SqlUtil.user="admin";
              session=request.getSession();
	     session.setAttribute("newuser","durgesh mishra");
			 RequestDispatcher rd=request.getRequestDispatcher("admin_home.jsp");
			 rd.forward(request, response);
        
            }
    else
    {  
        try
        {
            ResultSet rs=SqlUtil.retrieve("Select * from user where mail='"+mail+"' and password='"+password+"'");
        
            if(rs.next())
            {
                String user= rs.getString("name");
                session=request.getSession();
                SqlUtil.mail=mail;
                SqlUtil.user=user;        
                session.setAttribute("newuser",user);
                RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
                rd.forward(request, response);

            }    
            else
            {  
                request.setAttribute("errorMessage","Invalid Mail-Id or Password");
                RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
        }
        catch(Exception ex)
        {
                         request.setAttribute("errorMessage","Invalid Mail-Id or Password");
			 RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			 rd.forward(request, response);
        }
    }
}
catch(Exception ex)
{
    request.setAttribute("errorMessage","Try Again");
    RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
    rd.forward(request, response);
    System.out.println(""+ex);
    
}
%>
