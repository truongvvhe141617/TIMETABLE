
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="contener">
            <div>
                <h2><img src="images/table.png" width="20px" height="20px"/> Time table </h2>
            </div>
            <div class="process">
                <form action="search" method="post">
                    <div class="head">
                        <div class="from">
                            <p>From Date</p>
                            <input type="text" name="from" value=""/>
                        </div>
                        <div class="to">
                            <p>To Date  </p>
                            <input type="text" name="to" value=""/>

                        </div>
                        <div class="search">
                            <input type="submit" value="Search" name="Search" />
                        </div>
                    </div>  
                </form>
                <form action="add" method="get">
                    <div class="addtimetable">
                        <input type="submit" value="Add timetable" name="addtime" />
                    </div>
                </form>
            </div>
            <div class="content">
                <c:if test="${isValid == 1}"> 
                    <p>Date is  invalid!</p>
                    <style>
                        p {color: red};
                        table {
                            display: none;
                        }
                    </style>
                </c:if>
                <c:if test="${searchIsEmpty == 1}">
                    <p>Not Found!</p>
                </c:if>
                <c:if test="${searchIsEmpty == null}">
                    <table border="solid 0.5px white">
                        <thead>
                            <tr>
                                <th>Date</th>
                                <th>Slot</th>
                                <th>Time</th>
                                <th><span class="h">Class</span></th>
                                <th>Teacher</th>
                                <th>Room</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${list}" var="o">
                                <tr>
                                    <td>${o.date}</td>
                                    <td>${o.slot}</td>
                                    <td>${o.time}</td>
                                    <td><span class="h">${o.className}</span></td>
                                    <td>${o.teacher}</td>
                                    <td>${o.room}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

            </div>

           

        </div>
    </body>
</html>
