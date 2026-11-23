<%@ page import="java.util.List" %>
<%@ page import="com.rehan.library.model.Book" %>
<%
 List<Book> books=(List<Book>)request.getAttribute("books");
 List<String> categories=(List<String>)request.getAttribute("categories");
 String search=(String)request.getAttribute("search"); String selected=(String)request.getAttribute("selectedCategory");
%>
<!DOCTYPE html><html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Books | Library Management</title><link rel="stylesheet" href="css/style.css"></head>
<body><div class="app"><aside class="sidebar"><div class="brand"><div>LIBRARY</div><span>MANAGEMENT</span></div><nav><a href="dashboard"><span>⌂</span> Dashboard</a><a class="active" href="books"><span>▤</span> Books</a><a href="books#add"><span>＋</span> Add Book</a><a href="issue-return"><span>↔</span> Issue / Return</a><a href="members"><span>♙</span> Members</a><a href="logout"><span>↪</span> Logout</a></nav></aside>
<main class="content"><header class="page-head"><div><div class="eyebrow">CATALOGUE</div><h1>Books</h1><p>Browse, search and manage your library catalogue.</p></div><a class="btn primary" href="#add">＋ Add Book</a></header>
<% if("1".equals(request.getParameter("added"))){%><div class="alert success">✓ Book added successfully.</div><%}%>
<% if(request.getAttribute("error")!=null){%><div class="alert danger"><%=request.getAttribute("error")%></div><%}%>
<section class="panel"><div class="filter-head"><div><h2>Catalogue</h2><p>Showing <strong><%=books==null?0:books.size()%></strong> matching titles.</p></div></div><form class="filters" action="books" method="get"><div class="search-box"><span>⌕</span><input name="search" value="<%=search%>" placeholder="Search title, author or category..."></div><select name="category"><option value="">All categories</option><%for(String c:categories){%><option value="<%=c%>" <%=c.equals(selected)?"selected":""%>><%=c%></option><%}%></select><button class="btn primary" type="submit">Filter</button><a class="btn ghost" href="books">Reset</a></form>
<div class="table-wrap"><table><thead><tr><th>Book</th><th>Author</th><th>Category</th><th>Total</th><th>Availability</th></tr></thead><tbody><%if(books!=null&&!books.isEmpty()){for(Book b:books){int percent=b.getQuantity()==0?0:(b.getAvailableQuantity()*100/b.getQuantity());%><tr><td><div class="book-cell"><div class="book-avatar">▤</div><div><b><%=b.getTitle()%></b><small>ID #<%=b.getId()%></small></div></div></td><td><%=b.getAuthor()%></td><td><span class="category"><%=b.getCategory()%></span></td><td><b><%=b.getQuantity()%></b></td><td><div class="avail-cell"><span class="availability <%=b.getAvailableQuantity()>0?"ok":"empty"%>"><%=b.getAvailableQuantity()%> available</span><div class="progress"><i style="width:<%=percent%>%"></i></div></div></td></tr><%}}else{%><tr><td colspan="5"><div class="empty-state"><div>⌕</div><b>No books found</b><span>Try another search or add a new book.</span></div></td></tr><%}%></tbody></table></div></section>
<section class="panel" id="add"><div class="panel-title"><div><h2>Add New Book</h2><p>Create a new catalogue record.</p></div></div><form class="form-grid" action="books" method="post"><div><label>Book Title</label><input name="title" placeholder="e.g. Head First Java" required></div><div><label>Author</label><input name="author" placeholder="e.g. Kathy Sierra" required></div><div><label>Category</label><input name="category" placeholder="e.g. Java"></div><div><label>Quantity</label><input type="number" min="1" max="100" name="quantity" placeholder="5" required></div><div class="full"><button class="btn primary" type="submit">＋ Add Book to Catalogue</button></div></form></section>
<!-- Added Feature: Book Availability Status Bar -->
<section class="panel" id="availabilityStatusPanel" style="margin-top: 20px;">
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 10px;">
        <h3 style="margin: 0;">Catalogue Availability Status</h3>
        <span id="libraryStatusSummary" style="font-size: 14px; font-weight: 600;">Calculating...</span>
    </div>
    <div style="width: 100%; height: 12px; background: #e5e7eb; border-radius: 999px; overflow: hidden;">
        <div id="libraryStatusFill" style="width: 0%; height: 100%; background: #16a34a; transition: width 0.3s ease;"></div>
    </div>
</section>

<script>
(function () {
    function refreshBookStatusBar() {
        const rows = document.querySelectorAll(".table-wrap table tbody tr");
        let totalBooks = rows.length;
        let availableBooks = 0;

        rows.forEach(function (row) {
            const cells = row.querySelectorAll("td");
            
            const availabilityText = (cells[4] ? cells[4].textContent : row.textContent).trim().toLowerCase();
            if (
                (availabilityText.includes("available") && !availabilityText.includes("unavailable") && !availabilityText.includes("not available")) ||
                (!isNaN(parseInt(availabilityText, 10)) && parseInt(availabilityText, 10) > 0)
            ) {
                availableBooks++;
            }
        });

        const percentage = totalBooks > 0 ? Math.round((availableBooks / totalBooks) * 100) : 0;
        const bar = document.getElementById("libraryStatusFill");
        const summary = document.getElementById("libraryStatusSummary");

        if (bar) {
            bar.style.width = percentage + "%";
        }
        if (summary) {
            summary.textContent = totalBooks > 0
                ? availableBooks + " of " + totalBooks + " titles available (" + percentage + "%)"
                : "No books listed yet (0%)";
        }
    }

    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", refreshBookStatusBar);
    } else {
        refreshBookStatusBar();
    }
})();
</script>
</main></div></body></html>
