<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>

<br>
<h1 align="center">Squad List</h1>
<br>
<div align="center">
    <form action="addpost.jsp" enctype="multipart/form-data" method="post">
        <label for="photo" class="form-label">사진:</label>
        <input type="file" id="photo" name="photo"/>
        <br />
        <label for="name" class="form-label">이름:</label>
        <input type="text" id="name" name="name"/>
        <br />
        <label for="age" class="form-label">나이:</label>
        <input type="text" id="age" name="age"/>
        <br />
        <label for="position" class="form-label">보직:</label>
        <input type="text" id="position" name="position"/>
        <br />
        <label for="email" class="form-label">e-mail:</label>
        <input type="text" id="email" name="email"/>
        <br />
        <label for="militaryNum" class="form-label">군번:</label>
        <input type="text" id="militaryNum" name="militaryNum"/>
        <br />
        <label for="birth" class="form-label">생년월일:</label>
        <input type="text" id="birth" name="birth"/>
        <br />
        <button type="submit" class="btn btn-primary" value="Add Post">추가</button>
        <button type="button" class="btn btn-danger"><a href="posts.jsp">취소</a></button>
    </form>
</div>


</body>
</html>