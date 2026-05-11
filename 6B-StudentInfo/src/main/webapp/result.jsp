<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Student Result</title>
</head>

<body>

<h2>Student Mark Details</h2>

<%
String r = (String)session.getAttribute("rollno");

if(r == null)
{
    response.sendRedirect("login.jsp");
}

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

    "select s.name,s.rollno,m.subject,m.mark " +
    "from student s join marks m " +
    "on s.rollno=m.rollno " +
    "where s.rollno='" + r + "'"

    );

    int total = 0;
%>

<table border="1" cellpadding="10">

<tr>
<th>Name</th>
<th>Roll No</th>
<th>Subject</th>
<th>Mark</th>
</tr>

<%
while(rs.next())
{
    total = total + rs.getInt("mark");
%>

<tr>

<td><%= rs.getString("name") %></td>

<td><%= rs.getString("rollno") %></td>

<td><%= rs.getString("subject") %></td>

<td><%= rs.getInt("mark") %></td>

</tr>

<%
}
%>

<tr>
<td colspan="3"><b>Total</b></td>
<td><b><%= total %></b></td>
</tr>

</table>

<%
con.close();
}
catch(Exception e)
{
    out.println(e);
}
%>

</body>
</html>