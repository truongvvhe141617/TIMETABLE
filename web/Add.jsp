

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/add.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header_title">
            <img src="images/table.png" alt=""/> <span> Add timetable </span>
        </div>
        <div class="addtimeTable">
            <form action="add" method="POST">
                <table border="1">
                    <tr style="background-color: #DCDCDC">
                        <td>Date</td>
                        <td><input type="date" name="date" value="" /></td>
                    </tr>
                    <tr>
                        <td>Slot</td>
                        <td>
                            <select name="slot">
                                <c:forEach var="o" items="${listTime}">
                                    <option value="${o.slot}">${o.slot} (${o.time})</option>
                                </c:forEach>
                            </select>  
                        </td>
                    </tr>
                    <tr style="background-color: #DCDCDC">
                        <td>Room</td>
                        <td>
                            <select name="room">
                                <c:forEach var="o" items="${listRoom}">
                                    <option value="${o.id}">${o.room}</option>
                                </c:forEach>
                            </select>  
                        </td>
                    </tr>
                    <tr>
                        <td>Teacher</td>
                        <td><input type="text" name="teacher" value="${teacher}" /></td>
                    </tr>
                    <tr style="background-color: #DCDCDC">
                        <td>Class</td>
                        <td>
                            <select name="class">
                                <c:forEach var="o" items="${listClass}">
                                    <option value="${o.id}">${o.name}</option>
                                </c:forEach>
                            </select>  
                        </td>
                    </tr>
                    <tr style="background-color: gainsboro">
                        <td></td>
                        <td>
                            <button type="submit">
                                Save
                            </button>
                        </td>
                    </tr>
                </table>
                 <h3 style="color: red">${result}</h3>
                 <h3>${mess}</h3>
            </form>
        </div>
    </body>
</html>
