<%-- 
    Document   : login_c
    Created on : May 19, 2017, 8:40:10 AM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%
            String username=request.getParameter("username");
             String password=request.getParameter("password");
             String firstname=request.getParameter("firstname");
             String lastname=request.getParameter("lastname");
             
             
             
             int uid=0;
             try
             {
                  Class.forName("com.mysql.jdbc.Driver");
                                                                    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?zeroDateTimeBehavior=convertToNull","root","");
                                                                     Statement stm=conn.createStatement();
                                                                     String query="insert into login values(null,'"+firstname+"','"+lastname+"','"+username+"','"+password+"',0,now(),0,now(),'Active')";
                                                                     stm.executeUpdate(query);
                                                                     
                                                                     query="select * from login where username='"+username+"' and password='"+password+"'";
                                                                     ResultSet rs=rs=stm.executeQuery(query);
                                                                     int result=0;
                                                                     while(rs.next())
                                                                     {
                                                                        result=1;
                                                                         uid=rs.getInt("uid");
                                                                        break;
                                                                     }
                                                                     if(result==1)
                                                                     {
                                                                         response.sendRedirect("../index.jsp");
                                                                         session.setAttribute("username",username);
                                                                         session.setAttribute("uid",uid);
                                                                     }
                                                                     else
                                                                     {
                                                                         response.sendRedirect("../signup.jsp");
                                                                     }
                                                                     
             }
             catch(Exception e)
             {
                 out.println(e);
             }%>
    
</html>
