<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<sql:setDataSource  var="ds"   driver="com.mysql.jdbc.Driver" 
                        url="jdbc:mysql://localhost:3306/mydb"
                        user="root"
                        password="abc123"
                        />

<sql:query var="listPersons" dataSource="${ds}">
    select name, age from person;
</sql:query>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
My JSP Index <br>
<form action="/webdyn/jdbcservlet" method="GET">
	Invoke MyServlet <br>
	<input type="Submit" value="Submit">
</form>

<div align="center">
    <table border="1" cellpadding="5">
        <caption>List of persons</caption>
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <c:forEach var="personna" items="${listPersons.rows}">
            <tr>
                <td><c:out value="${personna.name}" /></td>
                <td><c:out value="${personna.age}" /></td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>