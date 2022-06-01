<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>


<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <title>Главная</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
</head>
<body alink="#01adfe" vlink="#01adfe">
<header>
 <div class = "title">Магазин поддержанной мебели</div>
 <div class="username">
 ${pageContext.request.userPrincipal.name}
 </div>
<div class="menu">
  <sec:authorize access="!isAuthenticated()">
    <a href="/login" style="text-decoration: none;">Войти |</a>
    <a href="/registration" style="text-decoration: none;">Регистрация</a>
  </sec:authorize>
  <sec:authorize access="isAuthenticated()">
    <a href="/logout" style="text-decoration: none;">Выйти</a>
  </sec:authorize>
</div>
</header>
<br>

 <sec:authorize access="hasRole('ROLE_ADMIN')">
    <form name="user" action="/" method="get">


    <div class="tabl">
      <table style="font: 15pt Consolas; color: #01adfe;">
        <thead>
        <th>ID</th>
        <th>UserName</th>
        <th>Password</th>
        <th>Roles</th>
        </thead>
        <c:forEach items="${allUsers}" var="user">
          <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>
              <c:forEach items="${user.roles}" var="role">${role.name}; </c:forEach>
            </td>
            <td>
              <form action="${pageContext.request.contextPath}/admin" method="post">
                <input type="hidden" name="userId" value="${user.id}"/>
                <input type="hidden" name="action" value="delete"/>
                <button class="button" type="submit"><span>Delete</span></button>
              </form>

            </td>

          </tr>
        </c:forEach>
      </table>
      </div>
    </div>
   </form>
    </sec:authorize>

<sec:authorize access="!isAuthenticated()">
  <div style="text-align: center;position:relative; top: 55px;font: 48pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">Cheerful chair</div>
</sec:authorize>

    <sec:authorize access="hasRole('ROLE_USER')">
    <div style="text-align: center;position:relative;font: 48pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">Мебель в ассортименте</div>

    <div style="left: 540px;top: 110px;position:relative;font: 12pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">750 р</div>

    <div style="left: 725px;top: 95px;position:relative;font: 12pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">5000 р</div>
    <div style="left: 900px;top: 78px;position:relative;font: 12pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">2500 р</div>
    <div style="left: 1080px;top: 63px;position:relative;font: 12pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">10000 р</div>
    <div style="left: 1270px;top: 50px;position:relative;font: 12pt Coca-Cola Regular rus-lat; color: #01adfe; text-shadow: black 1px 1px 0, black -1px -1px 0, black -1px 1px 0, black 1px -1px 0;">3500 р</div>
    <div class="book">
    <img src="/resources/столик.png"  width=20% height=50% style="margin-right: 2%;">
    <img src="/resources/диваны.jpg"  width=16% height=16% style="margin-right: 2%;">
    <img src="/resources/стулья.jpg"  width=17% height=17% style="margin-right: 2%;">
    <img src="/resources/кровать.jpg"  width=17% height=17% style="margin-right: 2%;">
    <img src="/resources/матрас.jpg"  width=17% height=17% style="margin-right: 2%;">
    <br>
    <form action="/add" method="post" style="float: left">

       <input type="hidden" name="name" value="Стол крафтовый"/>
       <input type="hidden" name="author" value="750 р"/>
        <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
       <button class="button" type="submit" style="margin-left: 50%"><span>Добавить</span></button>
    </form>
    <form action="/add" method="post" style="float: left;">
       <input type="hidden" name="name" value="Диван гостинный"/>
       <input type="hidden" name="author" value="5000 р"/>
        <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
       <button class="button" type="submit" style="margin-left: 130%"><span>Добавить</span></button>
     </form>
     <form action="/add" method="post" style="float: left;">
            <input type="hidden" name="name" value="Стул в классическом стиле"/>
            <input type="hidden" name="author" value="2500 р"/>
             <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
            <button class="button" type="submit" style="margin-left: 200%"><span>Добавить</span></button>
          </form>
     <form action="/add" method="post" style="float: left;">
        <input type="hidden" name="name" value="Кровать в евростиле"/>
        <input type="hidden" name="author" value="10000 р"/>
        <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
        <button class="button" type="submit" style="margin-left: 280%"><span>Добавить</span></button>
     </form>
     <form action="/add" method="post" style="float: left;">
             <input type="hidden" name="name" value="Надувной матрас"/>
             <input type="hidden" name="author" value="3500 р"/>
             <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
             <button class="button" type="submit" style="margin-left: 360%"><span>Добавить</span></button>
          </form>
     </div>
       <br>
       <br>

    <div class="tabl">
    <table style="font: 24pt Consolas; color: #01adfe;text-align: center">



        <thead>
        <th>Название</th>
        <th>Цена</th>
        </thead>
        <c:forEach items="${reserves}" var="res">
          <tr>
            <td>${res.name}</td>
            <td>${res.author}</td>
            <td><form action="/${res.id}/remove" method="post">
             <button type="submit">Убрать из корзины</button>
              </form>
            </td>
          </tr>
        </c:forEach>
      </table>
      <form action="/test" method="get" align="center">
         <input type="hidden" name="usrname" value="${pageContext.request.userPrincipal.name}"/>
        <button class="button3" type="submit"><span>Загрузить корзину</span></button>
      </form>
      </div>
    </form>
    </sec:authorize>
</body>
</html>