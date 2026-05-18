<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 17-May-26
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.example.peerlearn.model.Post" %>
<%@ page import="com.example.peerlearn.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>PeerLearn - Feed</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .filter-bar { display: flex; gap: 1rem; margin-bottom: 2rem; background: white; padding: 1rem; border-radius: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); }
        .post-title { margin: 0.5rem 0; color: var(--text-main); font-size: 1.25rem; }
        .post-meta { font-size: 0.875rem; color: var(--text-muted); margin-bottom: 1rem; }
    </style>
</head>
<body>
    <header>
        <a href="PostServlet?action=list" class="brand">PeerLearn</a>
        <nav>
            <a href="UserServlet?action=viewProfile">My Profile</a>
            <a href="PostServlet?action=wishlist">Wishlist</a>
            <% if ("ADMIN".equals(user.getRole())) { %>
            <a href="admin/dashboard.jsp" style="color: var(--primary-color);">Admin Panel</a>
            <% } %>
            <a href="AuthServlet?action=logout">Logout</a>
        </nav>
    </header>

    <div class="container">
        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
            <h2>Community Feed</h2>
            <a href="PostServlet?action=new" class="btn-primary" style="text-decoration: none;">+ Ask Question</a>
        </div>

        <div class="filter-bar">
            <form action="PostServlet" method="GET" style="display: flex; gap: 1rem; width: 100%;">
                <input type="hidden" name="action" value="list">

                <input type="text" name="search" placeholder="Search titles or authors..."
                       value="<%= request.getParmeter("search") != null ? request.getParameter("search") : "" %>"
                       style="flex-grow: 1;">

                <select name="category_id" style="width: 200px;">
                    <option value="">All Categories</option>
                    <% if (categories != null) {
                        String selectedCat = request.getParameter("category_id");
                        for (Category cat : categories) { %>
                    <option value="<%= cat.getId() %>" <%= (selectedCat != null && selectedCat.equals(String.valueOf(cat.getId()))) ? "selected" : "" %>>
                        <%= cat.getName() %>
                    </option>
                    <%  }
                    } %>
                </select>
    </div>
</body>
</html>