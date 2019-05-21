<%-- 
    Document   : result
    Created on : Mar, 2018, 12:00:20 PM
    Author     : Harsh 
--%>

<%@page import="utility.SqlUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <style type="text/css">
            .background
            {
                background-size:  initial;
                background-repeat: no-repeat;
                background-attachment: scroll;
            }
            
            #top
            {
                background-color: #333333;
                color:white;
                position: fixed;
                padding-right:100%;
                border:solid gray;
            }
            #top a
            {
                position:absolute;
                margin-top: 2px;
                margin-left:500px;
                color:white;
                font-size: 22px;
            }
            #res
            {
                margin-top: 80px;
                position:fixed;
                width:25%;
                
            }
            header h1{
                font-family: serif;
                margin-left: 500px;
            }
            
            #result
            {
                position:absolute;
                margin-left:950px;
                z-index: -1;
                border:solid gray;
            }
            #Question
            {
                margin-top: 80px;
                margin-left:10px;
                width:60%;
                position:absolute;
                table-layout: fixed;
                word-wrap:break-word;
                z-index: -1;
                border:solid gray;
            }
            img{
                border-radius: 8px;
            }
            #feedback{
                position: fixed;
                margin-top:460px;
                margin-left: 900px;
            }
            #feedback div{
                padding:10px;
                background-color: #333333;
                width:370px;
                height:70px;
                border: solid gray;
            }
            #feedback div a{
                color:white;
            }
        </style>
        <script>
        $(document).
        Cookie cookie = new Cookie("k",1);
		res.addCookie(cookie);
        out.print(k);
        </script>
    </head>
    <body background="images/image12.jpg">
        <header id="top">
            <h1 color="white">RESULT:<a class="btn btn-outline-danger" href="logout.jsp"><b>Logout</b></a></h1>
        </header>
        <%!
            int credit_score=0;
            int not_attempted=0;
            int incorrect=0;
            String ans[][]= new String[11][5];
            %>
        <% 
            if(request.getParameter("btn")!=null){   
           
            try
            {
                for(int i=1;i<=10;i++)
                {
                String temp="s_no"+i;
                ans[i][1]=request.getParameter(temp);
                ans[i][2]=request.getParameter(ans[i][1]);    
                }
                
                ResultSet rs=SqlUtil.retrieve("select s_no,correct_option from "+SqlUtil.type); 
                if(rs!=null)
                {
                    for(int i=1;i<=10;i++)
                    {
                        if(ans[i][1]!=null)
                        {                            
                            if(ans[i][2]==null)
                            {
                                ans[i][2]="0";
                                not_attempted++;
                            }
                            else
                            {
                                rs=SqlUtil.retrieve("select s_no,correct_option from "+SqlUtil.type);
                            while(rs.next())
                            {
                                if(ans[i][1].equals(Integer.toString(rs.getInt("s_no"))))
                                {       
                                    if(ans[i][2].equals(rs.getString("correct_option")))
                                    {
                                        credit_score++;
                                    }
                                    else
                                    {
                                        incorrect++;
                                    }
                                break;
                                }
                            }
                            }
                        }
                    }   
                }
            }
            catch(Exception ex)
            {
             System.out.print(ex);
            }
            }
                %>
                <header id="res">
                <table class="table table-dark" id="result">
                <thead>
                  <tr>
                    <th scope="col">Your Result:</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Total No. of Questions:</td>
                    <td>10</td>
                  </tr>
                  <tr>
                    <td>No. of Questions Not Attempted:</td>
                    <td>
                        <%
                            out.print(not_attempted);
                        %>
                    </td>
                  </tr>
                  <tr>
                    <td>No. of Questions Attempted:</td>
                    <td>
                        <%
                            out.print((10-not_attempted));
                        %>
                    </td>
                  </tr>
                  <tr>
                    <td>No. of Correct Answers:</td>
                    <td>
                        <%
                            out.print(credit_score);
                        %>
                    </td>
                  </tr>
                  <tr>
                    <td>No. of Wrong Answers:</td>
                    <td>
                        <%
                            out.print(incorrect);
                        %>
                    </td>
                  <tr>
                      <td><b>Credit Score:</b></td>
                    <td>
                        <b>
                        <%
                            out.print(credit_score);
                        %>
                        </b>
                    </td>
                  </tr>
                </tbody>
              </table>
                        </header>
<%  if(request.getParameter("btn")!=null){   
           
    try{
    ResultSet rs=SqlUtil.retrieve("select * from "+SqlUtil.type); 
    if(rs!=null)
    {
        %>
        <table class="table table-dark" id="Question">
            <thead>
                <tr>
                    <th width="100" scope="col">Correct/<br>Incorrect</th>
                    <th width="100" scope="col">Your Option</th>
                    <th scope="col">Question-Answer</th>
                </tr>
            </thead>
            <tbody>
        <%
        for(int i=1;i<=10;i++)
        {
            
            rs=SqlUtil.retrieve("select * from "+SqlUtil.type);
        while(rs.next())
        {
                if(ans[i][1].equals(Integer.toString(rs.getInt("s_no"))))
                {
                    String a="a";
                    if(i==1)
                    a="bg-primary";
                    else if(i==2)
                    a="bg-success";
                    else if(i==3)
                    a="bg-warning";
                    else if(i==4)
                    a="bg-danger";
                    else if(i==5)
                    a="bg-info";
                    else if(i==6)
                    a="bg-primary";
                    else if(i==7)
                    a="bg-success";
                    else if(i==8)
                    a="bg-warning";
                    else if(i==9)
                    a="bg-danger";
                    else if(i==10)
                    a="bg-info";
%>
                <tr class="<% out.print(a); %>">
                    <td width="80">
                        <%
                            if(ans[i][2].equals(rs.getString("correct_option")))
                            {
                                %>
                                <img height="50" width="50" src="images/correct.jpg">
                                <%
                            }
                            else{
                                %>
                                <img height="50" width="50" src="images/wrong.jpg">
                                <%
                            }
                        %>
                    </td>
                    <td width="30" ><b><% out.print(ans[i][2]); %></b></td>
                    <td><%out.print(rs.getString("question")); %></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <%
                            
                            String correct_option = rs.getString("correct_option");
                        %><b><%out.print(correct_option+". ");%></b>
                        <%
                            String temp="option"+correct_option;
                            String answer=rs.getString(temp);
                            out.print(answer);
                            
                        %>
                    </td>
                </tr>
                
<%
                        }
        }   
        }
%>
        </tbody>
        </table>
<%
        }
        }catch(Exception ex){

        }
}
%>
    <header id="feedback">
        <div>
            <a class="btn btn-outline-warning" href="feedback.jsp" ><b>Give Feedback</b></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-outline-success" href="welcome.jsp"><b>Go Back to Profile</b></a>
        </div>
    </header>
</body>
</html>
