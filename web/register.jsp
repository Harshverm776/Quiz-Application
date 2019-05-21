<%-- 
    Document   : re
    Created on : Jun 9, 2018, 2:36:07 PM
    Author     : MISHRA
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Date"%>
<%@page import="utility.SqlUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
 try{
    String name=new String();
    String email=new String();
    String dob=new String();
    String gender=new String();
    String mobile_no = new String();
    String qualification= new String();
    String password=new String();
    String cpassword=new String();
    String security_code = new String();
    response.setContentType("text/html;charset=UTF-8");
    name=request.getParameter("uname");
    email=request.getParameter("mail");
    dob=request.getParameter("dob");
    gender = request.getParameter("gender");
    mobile_no = request.getParameter("mobile_no");
    qualification = request.getParameter("qualification");
    password=request.getParameter("pass");
    cpassword=request.getParameter("cpass");
    security_code= request.getParameter("security_code");
    
       if(!email.equals("dmishra2309@gmail.com"))
       {    //match if password or confirm password same 
           
           try{
                ResultSet rs=SqlUtil.retrieve("select mail from user where mail='"+email+"'"); 
                if(rs.next()==true)
                {
                    out.println("<script> alert('Mail-id Already Exist...Please Register with Different id.'); location='register.html' </script>");
                }
                else
                {
                    SqlUtil.update("create table if not exists user(name varchar(30) not null,mail varchar(50) primary key,dob varchar(10) not null,gender varchar(10) not null,mobile_no varchar(10) not null,qualification varchar(40) not null,security_code varchar(40) not null,password varchar(20) not null)");
                    SqlUtil.update("insert into user values('"+name+"','"+email+"','"+dob+"','"+gender+"','"+mobile_no+"','"+qualification+"','"+security_code+"','"+password+"')");
                    request.setAttribute("newUser",name);
                    out.println("<script> alert('You have been Successfully Registered.'); location='login.jsp'; </script>");
                }
           }catch(Exception ex){
           System.out.println("Exception: "+ex);
           out.println("<script> alert('Something Want Wrong, Try Again.'); location='register.html' </script>");
           }
                  }
       else{
            out.println("<script> alert('Mail-id Already Exist...Please Register with Different id.'); location='register.html' </script>");
            }
 }
catch(Exception ex)
{
System.out.println("Exception: "+ex);
out.println("<script> alert('Something Want Wrong, Try Again.'); location='register.html' </script>");
}
%>
