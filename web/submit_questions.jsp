<%-- 
    Document   : submit_questions
    Created on : Jun 9, 2018, 5:06:51 PM
    Author     : MISHRA
--%>

<%@page import="utility.SqlUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String type=request.getParameter("typeselected");
    String question=request.getParameter("question");
    String option1=request.getParameter("opt1");
    String option2=request.getParameter("opt2");
    String option3=request.getParameter("opt3");
    String option4=request.getParameter("opt4");
    String correct_option=request.getParameter("correct_opt");
        try{
            
            SqlUtil.update("create table if not exists "+type+"(S_No int auto_increment ,question varchar(500) not null,option1 varchar(50) not null,option2 varchar(50) not null,option3 varchar(50) not null,option4 varchar(50) not null,correct_option varchar(50) not null, primary key(S_no));");
            SqlUtil.update("insert into "+type+ "(question,option1 ,option2 ,option3 ,option4 ,correct_option) values('"+question+"','"+option1+"','"+option2+"','"+option3+"','"+option4+"','"+correct_option+"')");
            out.println("<script> alert('Question Successfully Submitted.'); location='add_question.html'; </script>");
       }
       catch(Exception ex)
       {
           System.out.print("Exception:"+ex);
           out.println("<script> alert('Try Again.'); location='add_question.html'; </script>");
       }
   
    %>
