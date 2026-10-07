<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rehan.library.model.User" %>
<%@ page import="com.rehan.library.model.Book" %>
<%@ page import="com.rehan.library.model.IssueRecord" %>
<%
    User user=(User)session.getAttribute("user");
    Map<String,Integer> stats=(Map<String,Integer>)request.getAttribute("stats");
    List<Book> recentBooks=(List<Book>)request.getAttribute("recentBooks");
    List<IssueRecord> recentIssues=(List<IssueRecord>)request.getAttribute("recentIssues");
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Dashboard | Library Management</title><link rel="stylesheet" href="css/style.css"></head>
<body><div class="app">
<aside class="sidebar"><div class="brand"><div>LIBRARY</div><span>MANAGEMENT</span></div><nav>
<a class="active" href="dashboard"><span>⌂</span> Dashboard</a><a href="books"><span>▤</span> Books</a><a href="books#add"><span>＋</span> Add Book</a><a href="issue-return"><span>↔</span> Issue / Return</a><a href="members"><span>♙</span> Members</a><a href="logout"><span>↪</span> Logout</a>
</nav><div class="side-footer">Library Admin Panel<br><small>Java • JSP • MySQL</small></div></aside>
<main class="content"><header class="page-head"><div><div class="eyebrow">OVERVIEW</div><h1>Dashboard</h1><p>Welcome back, <strong><%=user.getName()%></strong>. Here's today's library overview.</p></div><a class="profile" href="members"><span class="avatar"><%=user.getName().substring(0,1).toUpperCase()%></span><span><b><%=user.getName()%></b><small><%=user.getRole()%></small></span></a></header>
<section class="stats">
<div class="stat-card"><div class="stat-icon blue">▤</div><div><span>Book Titles</span><strong><%=stats.get("titles")%></strong><small>in catalogue</small></div></div>
<div class="stat-card"><div class="stat-icon green">✓</div><div><span>Available Copies</span><strong><%=stats.get("available")%></strong><small>ready to issue</small></div></div>
<div class="stat-card"><div class="stat-icon orange">↗</div><div><span>Issued Copies</span><strong><%=stats.get("issued")%></strong><small>currently borrowed</small></div></div>
<div class="stat-card"><div class="stat-icon purple">♙</div><div><span>Members</span><strong><%=stats.get("members")%></strong><small>registered students</small></div></div>
</section>
<section class="quick-grid"><a class="quick-card blue-card" href="books"><b>Browse Books</b><span>Search and filter the catalogue.</span><em>→</em></a><a class="quick-card green-card" href="books#add"><b>Add a Book</b><span>Create a new catalogue record.</span><em>→</em></a><a class="quick-card orange-card" href="issue-return"><b>Issue / Return</b><span>Manage active borrowing transactions.</span><em>→</em></a><a class="quick-card purple-card" href="members"><b>Members</b><span>View all registered students.</span><em>→</em></a></section>
<section class="two-col"><div class="panel"><div class="panel-title"><div><h2>Recently Added Books</h2><p>Latest titles in the catalogue</p></div><a href="books">View all</a></div><div class="mini-list"><% for(Book b:recentBooks){ %><div class="mini-row"><div class="book-avatar">▤</div><div class="mini-main"><b><%=b.getTitle()%></b><span><%=b.getAuthor()%> • <%=b.getCategory()%></span></div><span class="availability <%=b.getAvailableQuantity()>0?"ok":"empty"%>"><%=b.getAvailableQuantity()%> available</span></div><% } %></div></div>
<div class="panel"><div class="panel-title"><div><h2>Recent Transactions</h2><p>Latest issue activity</p></div><a href="issue-return">Manage</a></div><div class="mini-list"><% if(recentIssues==null||recentIssues.isEmpty()){%><div class="empty-state"><div>✓</div><b>No transactions yet</b><span>Issue a book to see activity here.</span></div><%}else{for(IssueRecord r:recentIssues){%><div class="mini-row"><div class="book-avatar orange">↗</div><div class="mini-main"><b><%=r.getBookTitle()%></b><span><%=r.getUserName()%> • <%=r.getIssueDate()%></span></div><span class="status <%=r.getStatus().equals("ISSUED")?"issued":"returned"%>"><%=r.getStatus()%></span></div><%}}%></div></div></section>
</main></div></body></html>
