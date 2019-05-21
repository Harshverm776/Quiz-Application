<%-- 
    Document   : admin_home
    Created on : Mar 31, 2019, 1:04:23 PM
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
    </head>
        <style type="text/css">
            body
            {
                background-repeat: repeat-y;
                background-size: 5000px;
            }
            
            #top
            {
                background-color: #333333;
                color:white;
                position: fixed;
                padding-right:100%;
                border:solid gray;
            }
            #side
            {
                background-color: #333333;
                color:white;
                position: fixed;
                margin-top:60px;
                width:200px;
                height:100%;
                padding-top:10px;
                padding-left:30px;
                padding-right:30px;
                border:solid gray;
            }
            #side button{
            }
            #top a
            {
                position:absolute;
                margin-top: 2px;
                margin-left:350px;
                color:black;
                font-size: 22px;
            }
            header h1{
                font-family: serif;
                margin-left: 500px;
            }
            table{
                margin-left:230px;
                margin-top:100px;
                position: absolute;
                z-index:-1;
                display:none;
                word-wrap:break-word;
                table-layout: fixed;
            
            }
            #a1,#a6{
                width:1000px;
            }
            .list-group
            {
                margin-top:10px;
            }
            #sub_Q{
                color:lightgreen;
            }
            #sub_Q h5{
                color:#ffffff;
            }
        </style>
        <script type="text/javascript">
		$(document).ready(
			function()
			{
				var buttonElementId;
				$(':button').click(function(){
					buttonElementId=$(this).attr('id');
					var num=buttonElementId[1];
						var i;
						for(i=1;i<=6;i++)
						{
							if(i==num)
								$("#a"+num).show();
							else
								$("#a"+i).hide();
							
						}
				});
					
			});
	</script>
    <body background="images/admin.png">
        <header id="top">
            <h1 color="white">Welcome_Admin:<a class="btn btn-light" href="logout.jsp"><b>Logout</b></a></h1>
        </header>
        <header id="side">
            <a class="btn btn-outline-success"  id="sub_Q" href="add_question.html"><b><h5>Submit Question</h5></b></a>
            <br>
            <div class="list-group">
                <a href="#" class="list-group-item list-group-item-action"><button type="button" id="b1" class="btn btn-primary">User Details</button></a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-primary"><button type="button" id="b2"  class="btn btn-secondary">Aptitude</button></a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-secondary"><button type="button"  id="b3" class="btn btn-success">G.K</button></a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-success"><button type="button"  id="b4"  class="btn btn-danger">Technical</button></a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-danger"><button type="button"  id="b5"  class="btn btn-warning">Grammar</button></a>
                <a href="#" class="list-group-item list-group-item-action list-group-item-warning"><button type="button" id="b6"  class="btn btn-info">User Feedback</button></a>
            </div>
        </header>
        <%
        try{
            ResultSet rs=SqlUtil.retrieve("select * from user"); 
            if(rs!=null)
            {%>
                <table class="table table-sm table-dark" id="a1">
                      <thead>
                        <tr>
                          <th scope="col" width="10px">S_No</th>
                          <th scope="col" width="170px">Name</th>
                          <th scope="col" width="200px" >Mail-Id</th>
                          <th scope="col" width="100px" >DOB</th>
                          <th scope="col" width="100px">Gender</th>
                          <th scope="col" width="170px" >Mobile_No</th>
                          <th scope="col" width="200px">Qualification</th>
                        </tr>
                      </thead>
                      <tbody>
                <% int i=1;          
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(i);%></th>
                            <td><%out.print(rs.getString("name"));%></td>
                            <td><%out.print(rs.getString("mail"));%></td>
                          <td><%out.print(rs.getString("dob"));%></td>
                          <td><%out.print(rs.getString("gender"));%></td>
                          <td><%out.print(rs.getString("mobile_no"));%></td>
                          <td><%out.print(rs.getString("qualification"));%></td>
                        </tr>
                <%   i++; 
                }
                %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
        %>
        <%
        try{
            ResultSet rs=SqlUtil.retrieve("select * from aptitude"); 
            if(rs!=null)
            {%>
                <table class="table table-striped" id="a2">
                      <thead>
                        <tr>
                          <th scope="col">S_No</th>
                          <th scope="col">Question</th>
                          <th scope="col">Option-1</th>
                          <th scope="col">Option-2</th>
                          <th scope="col">Option-3</th>
                          <th scope="col">Option-4</th>
                          <th scope="col">Correct Option</th>
                        </tr>
                      </thead>
                      <tbody>
                <%          
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(rs.getInt("s_no"));%></th>
                            <td width="500px"><%out.print(rs.getString("question"));%></td>
                            <td><%out.print(rs.getString("option1"));%></td>
                          <td><%out.print(rs.getString("option2"));%></td>
                          <td><%out.print(rs.getString("option3"));%></td>
                          <td><%out.print(rs.getString("option4"));%></td>
                          <td><%out.print(rs.getString("correct_option"));%></td>
                        </tr>
                <% } %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
          try{
            ResultSet rs=SqlUtil.retrieve("select * from gk"); 
            if(rs!=null)
            {%>
                <table class="table table-striped" id="a3">
                      <thead>
                        <tr>
                          <th scope="col">S_No</th>
                          <th scope="col">Question</th>
                          <th scope="col">Option-1</th>
                          <th scope="col">Option-2</th>
                          <th scope="col">Option-3</th>
                          <th scope="col">Option-4</th>
                          <th scope="col">Correct Option</th>
                        </tr>
                      </thead>
                      <tbody>
                <%          
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(rs.getInt("s_no"));%></th>
                            <td width="500px"><%out.print(rs.getString("question"));%></td>
                            <td><%out.print(rs.getString("option1"));%></td>
                          <td><%out.print(rs.getString("option2"));%></td>
                          <td><%out.print(rs.getString("option3"));%></td>
                          <td><%out.print(rs.getString("option4"));%></td>
                          <td><%out.print(rs.getString("correct_option"));%></td>
                        </tr>
                <% } %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
        %>
        <%
        try{
            ResultSet rs=SqlUtil.retrieve("select * from technical"); 
            if(rs!=null)
            {%>
                <table class="table table-striped" id="a4">
                      <thead>
                        <tr>
                          <th scope="col">S_No</th>
                          <th scope="col">Question</th>
                          <th scope="col">Option-1</th>
                          <th scope="col">Option-2</th>
                          <th scope="col">Option-3</th>
                          <th scope="col">Option-4</th>
                          <th scope="col">Correct Option</th>
                        </tr>
                      </thead>
                      <tbody>
                <%          
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(rs.getInt("s_no"));%></th>
                            <td width="500px"><%out.print(rs.getString("question"));%></td>
                            <td><%out.print(rs.getString("option1"));%></td>
                          <td><%out.print(rs.getString("option2"));%></td>
                          <td><%out.print(rs.getString("option3"));%></td>
                          <td><%out.print(rs.getString("option4"));%></td>
                          <td><%out.print(rs.getString("correct_option"));%></td>
                        </tr>
                <% } %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
        %>
        <%
        try{
            ResultSet rs=SqlUtil.retrieve("select * from grammar"); 
            if(rs!=null)
            {%>
                <table class="table table-striped" id="a5">
                      <thead>
                        <tr>
                          <th scope="col">S_No</th>
                          <th scope="col">Question</th>
                          <th scope="col">Option-1</th>
                          <th scope="col">Option-2</th>
                          <th scope="col">Option-3</th>
                          <th scope="col">Option-4</th>
                          <th scope="col">Correct Option</th>
                        </tr>
                      </thead>
                      <tbody>
                <%          
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(rs.getInt("s_no"));%></th>
                            <td width="500px"><%out.print(rs.getString("question"));%></td>
                            <td><%out.print(rs.getString("option1"));%></td>
                          <td><%out.print(rs.getString("option2"));%></td>
                          <td><%out.print(rs.getString("option3"));%></td>
                          <td><%out.print(rs.getString("option4"));%></td>
                          <td><%out.print(rs.getString("correct_option"));%></td>
                        </tr>
                <% } %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
        %>
        <%
        try{
            ResultSet rs=SqlUtil.retrieve("select * from feedback"); 
            if(rs!=null)
            {%>
                <table class="table table-sm table-dark" id="a6">
                      <thead>
                        <tr>
                          <th scope="col">S_No</th>
                          <th scope="col">Mail-Id</th>
                          <th scope="col" width="200px">Date & Time</th>
                          <th scope="col" width="200px"> Subject </th>
                          <th scope="col" width="300px"> Message</th>
                        </tr>
                      </thead>
                      <tbody>
                <%          int i=1;
                while(rs.next())
                {%>
                    
                        <tr>
                            <th scope="row"><%out.print(i);%></th>
                            <td><%out.print(rs.getString("mail"));%></td>
                            <td><%out.print(rs.getTimestamp("date_time"));%></td>
                            <td><%out.print(rs.getString("subject"));%></td>
                            <td><%out.print(rs.getString("feedback_d"));%></td>
                        </tr>
                <% i++; } %>
                      </tbody>
                    </table>
            <%
            } 
        }catch(Exception ex){
            
        }
        %>
    </body>
</html>
