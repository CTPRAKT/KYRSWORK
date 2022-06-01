<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE HTML>
<html xmlns:th="http://www.thymeleaf.org">
<head>
  <title>Корзина</title>
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