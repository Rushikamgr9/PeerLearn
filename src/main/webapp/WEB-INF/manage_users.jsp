<%--
  Created by IntelliJ IDEA.
  User: raeso
  Date: 5/11/2026
  Time: 11:33 AM
  To change this template use File | Settings | File Templates.
--%>
%@ page import="com.peerlearn.model.User" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User sessionUser = (User) session.getAttribute("user");
    if (sessionUser == null || !"ADMIN".equals(sessionUser.getRole())) {
        response.sendRedirect("../error.jsp"); return;
    }
    List<User> users = (List<User>) request.getAttribute("users");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Users - Admin</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        th, td { padding: 1rem; text-align: left; border-bottom: 1px solid #e5e7eb; }
        th { background: #f9fafb; font-weight: 600; color: var(--text-muted); }
        .action-form { display: inline-block; margin-right: 0.5rem; }
        td form button { background: none; border: none; cursor: pointer; text-decoration: underline; font-weight: 500;}
    </style>