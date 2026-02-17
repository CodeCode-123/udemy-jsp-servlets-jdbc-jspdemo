<%@ page import="java.util.*" %>
<html>
<body>
<!-- Step 1: Create HTML form -->
<form action="todo-demo.jsp" method="POST">
    Add new item: <input type="text" name="theItem" />  
    <input type="submit" value="Submit"/>
</form>
<!-- Step 2: Add new item to "To Do" list -->
<% 
    // get the TO DO items from the session
    List<String> items = (List<String>) session.getAttribute("myToDoList");
    // if the TO DO items doesn't exist, then create a new one
    if (items == null) {
    	items = new ArrayList<>();
    	session.setAttribute("myToDoList", items);
    }
    // see if there is form data to add
    String theItem = request.getParameter("theItem");
    boolean isItemNotEmpty = (theItem != null && theItem.trim().length() > 0);
    boolean isItemNotDuplicate = (theItem != null && !items.contains(theItem.trim()));
    if (isItemNotEmpty && isItemNotDuplicate) {
    	items.add(theItem);
    }
%>

<!-- Step 3: Display all "To Do" item from session -->
<hr>
<b>Todo List Items:</b><br>
<ol>
    <% for (String temp: items) {%>
    <li><%= temp %></li>
    <%} %>
</ol>
</body>
</html>