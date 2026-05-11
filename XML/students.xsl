<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>

<style>
table,th,td{
border:1px solid black;
border-collapse:collapse;
padding:8px;
text-align:center;
}
th{background:lightblue;}
</style>

</head>

<body>

<h2>Student Information</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Dept</th>
<th>Sem</th>
<th>Subject</th>
<th>Marks</th>
</tr>

<xsl:for-each select="students/student/subjects/subject">

<tr>

<td><xsl:value-of select="../../studentId"/></td>
<td><xsl:value-of select="../../name"/></td>
<td><xsl:value-of select="../../department"/></td>
<td><xsl:value-of select="../../semester"/></td>
<td><xsl:value-of select="subjectName"/></td>
<td><xsl:value-of select="marks"/></td>

</tr>

</xsl:for-each>

</table>

</body>
</html>

</xsl:template>
</xsl:stylesheet>