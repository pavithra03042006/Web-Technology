<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Student Login</title>
</head>

<body>

<h2>Student Login</h2>

<form method="post">

Roll Number :
<input type="text" name="rollno"><br><br>

Password :
<input type="password" name="pass"><br><br>

<input type="submit" value="Login">

</form>

<%
String r = request.getParameter("rollno");
String p = request.getParameter("pass");

if(r != null && p != null)
{
    try
    {
        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/studentdb",
        "root",
        "pavithra"
        );

        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery(
        "select * from student where rollno='" + r +
        "' and password='" + p + "'"
        );

        if(rs.next())
        {
            session.setAttribute("rollno", r);

            response.sendRedirect("result.jsp");
        }
        else
        {
            out.println("<h3>Invalid Login</h3>");
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