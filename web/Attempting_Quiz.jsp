<%-- 
    Document   : Attempting_Quiz
    Created on : Mar 19, 2019, 10:13:53 AM
    Author     : Harsh
--%>
<%@page import="utility.SqlUtil"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="utility.SqlUtil"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
           <style type="text/css" >
            body
            {
            	font-family: Arial, Helvetica, sans-serif;
                box-sizing: border-box;
                margin:0;
                position:absolute;
                background-repeat: repeat-y;
            }
            .background
            {
                background-size:  initial;
                background-repeat: no-repeat;
                background-attachment: scroll;
            }
            header{
                position:fixed;
                background-color:black;
                height:100px;
                width:100%;
                border: solid;
                border-color: #f44336;
                z-index: 1;
            }
            header h1{
                align:center;
                color: gold;
                display:inline;
                font-family: initial;
                font-size:50px;
                float:left;
                position: absolute;
                padding:2px 0px 0px 400px;
                margin-bottom: 0px;
                margin-top: 0px;
                margin-right: 470px;

            }
            header #total_marks{
                color:gold;
                position:absolute;
                margin-left:1050px;
                margin-top: 60px;
            }
            header #type{
                color:gold;
                position:absolute;
                margin-left:120px;
                margin-top: 60px;
            }
            .logout{
                color:whitesmoke;
                text-decoration:none;
                font-size: 24px;
                font-family: cursive;
                border: solid whitesmoke;
                border-radius: 6px;
                padding:3px;
                position:absolute;
                margin-left: 1000px;
            
            }
            .logout:hover,.logout:focus{
                font-size: 26px;
                color: gold;
                border-color: gold;
            }
            #head img
            {
                border-radius: 8px; 
                margin:7px;
            }
            #head #img2
            {
                position:absolute;
                margin-left:1150px;
            }
            #Q
            {
                width:90%;
                height: 100%;
                margin-left:70px;
                margin-top:80px;
                padding:10px;
            }
            #Q #r1
            {
                background-color: yellow;
                height: 100%;
                width:100%;
            }
            #Ques
            {
                border:solid;
                padding-bottom:20px;
            }
            #Ques h3
            {
                color:white;
                margin-bottom: 60px;
            }
            #A,#B,#C,#D{
                border:solid;
                border-color: black;
                border-width:2px;
                padding:5px;
                margin: 5px;
            }
            table
            {
                width:1070px;
                word-wrap:break-word;
                table-layout: fixed;
            }
            #r1c1
            {
                background-color: gainsboro;
                text-align:center;
            }
            
            #r2c1,#r3c1,#r4c1,#r5c1
            {
                text-align:center;
            }
            button[type=submit]
            {
                padding:5px;
                color:white;
                font-size: 20px;
                font-family:monospace;
                font-weight: bold;
                border-color:black;
                background-color: blue;
                border-radius: 10px;
                margin-left:100px;
                margin-bottom: 140px;
            }
            .submit:hover,.submit:focus
            {
            	font-weight: bold;
            	background-color: darkgreen;
            }
            input[type='radio']:after {
                width: 15px;
                height: 15px;
                border-radius: 15px;
                top: -2px;
                left: -1px;
                position: relative;
                background-color: #d1d3d1;
                content: '';
                display: inline-block;
                border: 2px solid black;
            }

            input[type='radio']:checked:after {
                width: 15px;
                height: 15px;
                border-radius: 15px;
                top: -2px;
                left: -1px;
                position: relative;
                background-color: #f44336;
                content: '';
                display: inline-block;
                border: 2px solid white;
            }
            </style>
    </head>
   
		
    <%
    Cookie cookies[] = request.getCookies();
    int k=0;
    for(Cookie c : cookies)
		{
			if(c.getName().equals("k"))
				k=Integer.parseInt(c.getValue());
		}
    System.out.print(k);
    %>
    <body background="images/img11.jpg">
<%
    SqlUtil.type =request.getParameter("type");
    SqlUtil.sub_type =request.getParameter("sub_type");
%>
        <header>
           <div id="head">
                    <IMG SRC="images/QA.jpg" height="90" width="90" align="left" >
                    <h1 color="white">QuizWebsite </h1>
                    <h2 id="total_marks"> Total Marks:10</h2>
                    <h2 id="type"> <% out.print(SqlUtil.type+":"+" Quiz-"+SqlUtil.sub_type); %> </h2>
                    <a class="logout" href="logout.jsp" >Logout</a>
                    <IMG  id="img2" SRC="images/DHB.jpg" height="90" width="90" align="right">
           </div>
        </header>
        <form action="result.jsp" method="post">
        <table id="Q" cellspacing="20px;" >
<%
    if((SqlUtil.type!=null) && (SqlUtil.sub_type!=null))
    {
    try{
    int till=Integer.parseInt(SqlUtil.sub_type);
    int from =till-1;
    till=till*10;
    from=from*10;
    System.out.print(from+"  "+till);
    ResultSet rs=SqlUtil.retrieve("select * from "+SqlUtil.type+" where s_no>"+from+" and s_no<="+till); 
    if(rs!=null)
    {
        int i=1;
        while(rs.next())
        {
         %>
            <tr>
                <td>
                    <div id="Ques" >
                        <input type="hidden" name="s_no<% out.print(i); %>" value="<% out.print(rs.getInt("s_no")); %>">
        <table>
            <tr>
                <td width="60px" id="r1c1">
                    <h1><b><% out.print(i); %>.)</b></h1>
                </td>
                <td>
                    <h3>
                        <%
                        out.print(rs.getString("question"));
                        %>
                    </h3>
                </td>
            </tr>
            <tr>
                <td id="r2c1">
                    
                    <input type="radio" name="<% out.print(rs.getInt("s_no")); %>" value="1" id="q<% out.print(i); %>a">
                </td>
                <td>
                    <div id="A"><b>1.)</b>
                         <%
                        out.print(rs.getString("option1"));
                        %>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="r3c1">
                    <input type="radio" name="<% out.print(rs.getInt("s_no")); %>" value="2" id="q<% out.print(rs.getInt("s_no")); %>b">
                </td>
                <td>
                    <div id="B"><b>2.)</b>
                        <%
                        out.print(rs.getString("option2"));
                        %>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="r4c1">
                    <input type="radio" name="<% out.print(rs.getInt("s_no")); %>" value="3" id="q<% out.print(rs.getInt("s_no")); %>c">
                </td>
                <td>
                    <div id="C"><b>3.)</b>
                        <%
                        out.print(rs.getString("option3"));
                        %>
                    </div>
                </td>
            </tr>
            <tr>
                <td id="r5c1">
                    <input type="radio" name="<% out.print(rs.getInt("s_no")); %>" value="4" id="q<% out.print(rs.getInt("s_no")); %>d">
                </td>
                <td>
                    <div id="D"><b>4.)</b>
                        <%
                        out.print(rs.getString("option4"));
                        %>
                    </div>
                </td>
            </tr>
            </table>
        </div>
                </td>
        </tr>
<%        i++;}
    }
    }
    catch(Exception ex)
    {
     System.out.print(ex);   
    }
}
%>
        </table>
        
       	<button type='submit' class="submit" name="btn"> Submit </button>
    </form>
    </body>
</html>
