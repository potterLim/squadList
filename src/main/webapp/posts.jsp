<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Squad List</title>
    <style>
        #list {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        #list td, #list th {
            border: 1px solid #ddd;
            padding: 8px;
            text-align:center;
        }
        #list tr:nth-child(even){background-color: #f2f2f2;}
        #list tr:hover {background-color: #ddd;}
        #list th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #006bb3;
            color: white;
        }
    </style>
    <script>
        function delete_ok(id){
            var a = confirm("정말로 삭제하겠습니까?");
            if(a) location.href='deletepost.jsp?id=' + id;
        }
    </script>
</head>
<body>
<h1 align="center">분대원 연명부</h1>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    request.setAttribute("list",list);
%>
<table id="list" width="90%">
    <tr>
        <th>사진</th>
        <th>이름</th>
        <th>나이</th>
        <th>보직</th>
        <th>e-mail</th>
        <th>군번</th>
        <th>생년월일</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    <c:forEach items="${list}" var="u">
        <tr>
            <td><img width="100px" height="100px" src="${pageContext.request.contextPath}/upload/${u.getPhotoPath()}"></td>
            <td>${u.getName()}</td>
            <td>${u.getAge()}</td>
            <td>${u.getPosition()}</td>
            <td>${u.getEmail()}</td>
            <td>${u.getMilNum()}</td>
            <td>${u.getBirth()}</td>
            <td><a href="editform.jsp?id=${u.getNo()}">Edit</a></td>
            <td><a href="javascript:delete_ok('${u.getNo()}')">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<div style="text-align: center">
    <a href="addpostform.jsp">분대원 추가</a>
</div>
</body>
</html>