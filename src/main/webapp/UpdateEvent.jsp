<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Event</title>
</head>
<body>
<form action="EventUpdateControler" method="post">


<c:forEach var="u" items="${eventData}">
Event ID
<input type="text" name="id" value="${u.eid}" readonly><br>
Venue<br>
<select name="venue">
<option <c:if test="${u.vid== 2}">selected</c:if> value="${u.vid}">KingsBury</option>
 <option <c:if test="${u.vid== 1}">selected</c:if> value="${u.vid}">Taj</option>
<option <c:if test="${u.vid== 3}">selected</c:if> value="${u.vid}">Galface</option>
</select>
<br>
Color<br>
<input type="color" name="color" value="${u.color}">
<br>
Date<br>
<input type="date" name="date" value="${u.date}"><br>
NoOfGuests<br>
<input type="number" name="number" value="${u.noOfGuests}">
<br>
<input type="submit" value="confirm">

</c:forEach>

</form>

</body>
</html>