<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Result Page</title>
</head>

<body>

<h2>Quiz Result</h2>

<%
int score = 0;

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
        String correct = rs.getString(7);

        String userans =
        request.getParameter(
            String.valueOf(rs.getInt(1))
        );

        if(correct.equals(userans))
        {
            score++;
        }
    }

    out.println("<h3>Your Score = " + score + "</h3>");

    con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

<a href="login.jsp">Logout</a>

</body>
</html>