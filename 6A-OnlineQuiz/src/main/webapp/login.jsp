<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Login Page</title>
</head>

<body>

<h2>Online Quiz Login</h2>

<form method="post">
    Username :
    <input type="text" name="uname"><br><br>

    Password :
    <input type="password" name="pass"><br><br>

    <input type="submit" value="Login">
</form>

<%
String u = request.getParameter("uname");
String p = request.getParameter("pass");

if(u != null && p != null)
{
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/quizdb",
            "root",
            "pavithra"
        );

        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery(
            "select * from users where username='" + u +
            "' and password='" + p + "'"
        );

        if(rs.next())
        {
            session.setAttribute("user", u);
            response.sendRedirect("quiz.jsp");
        }
        else
        {
            out.println("<h3>Invalid Username or Password</h3>");
        }

        con.close();
    }
    catch(Exception e)
    {
        out.println(e);
    }
}
%>

</body>
</html>