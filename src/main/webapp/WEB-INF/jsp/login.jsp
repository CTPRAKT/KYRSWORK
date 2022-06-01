<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body alink="#01adfe" vlink="#01adfe">
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>
<div>
  <form method="POST" action="/login">
   <br>
   <br>
   <br>
   <br>
   <br>
    <div class="log">
    <div class="blocklog">
      <input name="username" type="text" placeholder="Имя пользователя"
             autofocus="true"/><br><br>


      <input name="password" type="password" placeholder="Пароль"/><br><br>


      <button class="button" style="vertical-align:middle" type="submit"><span>Войти</span></button><br><br>
<div class="reg">
     <a href="/registration" style="text-decoration: none;">Зарегистрироваться</a>
     </div>
     </div>
     </div>
  </form>
</div>

</body>
</html>
