<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.example.dao.BoardDAO, com.example.bean.BoardVO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    BoardDAO boardDAO = new BoardDAO();
    String id=request.getParameter("id");
    BoardVO u=boardDAO.getBoard(Integer.parseInt(id));
%>

<h1 align="center">수정하기</h1>
<div align="center" class="album py-5 bg-light">
    <form action="editpost.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="seq" value="<%=u.getNo() %>"/>
        <label for="photo" class="form-label">사진:</label>
        <input type="file" id="photo" name="photo"/>
        <br />
        <label for="name" class="form-label">이름:</label>
        <input type="text" id="name" name="name" value="<%=u.getName() %>"/>
        <br />
        <label for="age" class="form-label">나이:</label>
        <input type="text" id="age" name="age" value="<%=u.getAge() %>"/>
        <br />
        <label for="position" class="form-label">보직:</label>
        <input type="text" id="position" name="position" value="<%=u.getPosition() %>"/>
        <br />
        <label for="email" class="form-label">이메일:</label>
        <input type="text" id="email" name="email" value="<%=u.getEmail() %>"/>
        <br />
        <label for="militaryNum" class="form-label">군번:</label>
        <input type="text" id="militaryNum" name="militaryNum" value="<%=u.getMilNum() %>"/>
        <br />
        <label for="birth" class="form-label">생년월일:</label>
        <input type="text" id="birth" name="birth" value="<%=u.getBirth() %>"/>
        <br />
        <button type="submit" class="btn btn-primary" value="Edit Post">수정</button>
        <button type="button" class="btn btn-danger"><a href="posts.jsp">취소</a></button>
    </form>
</div>

</body>
</html>