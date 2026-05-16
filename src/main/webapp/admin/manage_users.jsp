<%--
  Created by IntelliJ IDEA.
  User: raeso
  Date: 5/15/2026
  Time: 10:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.peerlearn.model.User" %>
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
<body>
<header>
    <a href="AdminServlet?action=dashboard" class="brand">PeerLearn Admin</a>
    <nav>
        <a href="AdminServlet?action=approvals">Approvals</a>
        <a href="AdminServlet?action=users" style="color: var(--primary-color);">Manage Users</a>
        <a href="AdminServlet?action=posts">Manage Posts</a>
        <a href="../AuthServlet?action=logout">Logout</a>
    </nav>
</header>
<div class="container">
    <h2>Manage Platform Users</h2>
    <div class="card" style="margin-top: 2rem; overflow-x: auto;">
            <% if(users == null || users.isEmpty()) { %>
        <p style="color: var(--text-muted);">No users registered yet.</p>
            <% } else { %>
        <table>
            <tr>
                <th>ID</th><th>Username</th><th>Name</th><th>Status</th><th>Actions</th>
            </tr>
        </table>

        </table>
        <% } %>
    </div>
</div>
</body>
</html>
