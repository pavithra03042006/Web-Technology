<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Quiz Page</title>
</head>

<body>

<h2>Online Quiz</h2>

<%
if(session.getAttribute("user") == null)
{
    response.sendRedirect("login.jsp");
}
%>

<form action="result.jsp" method="post">

<%
try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/quizdb",
        "root",
        "pavithra"
    );

    Statement st = con.createStatement();

    ResultSet rs = st.executeQuery("select * from questions");

    while(rs.next())
    {
%>

<p>
<b><%= rs.getInt(1) %>.
<%= rs.getString(2) %></b>
</p>

<input type="radio" name="<%= rs.getInt(1) %>"
value="<%= rs.getString(3) %>">
<%= rs.getString(3) %><br>

<input type="radio" name="<%= rs.getInt(1) %>"
value="<%= rs.getString(4) %>">
<%= rs.getString(4) %><br>

<input type="radio" name="<%= rs.getInt(1) %>"
value="<%= rs.getString(5) %>">
<%= rs.getString(5) %><br>

<input type="radio" name="<%= rs.getInt(1) %>"
value="<%= rs.getString(6) %>">
<%= rs.getString(6) %><br><br>

<%
    }

    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<input type="submit" value="Submit Quiz">

</form>

</body>
</html>