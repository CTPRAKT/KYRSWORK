<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>

<body alink="#01adfe" vlink="#01adfe">

  <form:form method="POST" modelAttribute="userForm">
    <br>
    <br>
    <div class="log">
    <div class="block">

      <form:input type="text" path="username" placeholder="Имя пользователя"
                  autofocus="true"></form:input>
      <form:errors path="username"></form:errors>
        ${usernameError}
        <br>
        <br>


      <form:input type="password" path="password" placeholder="Пароль"></form:input>

    <br>
    <br>
      <form:input type="password" path="passwordConfirm"
                  placeholder="Подтвердите пароль"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    <br>
    <br>
    <button class="button2" style="vertical-align:middle" type="submit"><span>Зарегистрироваться</span></button>
  </form:form>
  <br>
  <br>
 <div class="reg"> <a href="/" style="text-decoration: none;">Главная</a></div>
</div>
</div>
</body>
</html>