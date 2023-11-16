<%@ page import = "chat.ChatBean" %>
<%@ page import = "chat.Message" %>

<jsp:useBean id="chat" class="chat.ChatBean" scope="session"/>
<jsp:setProperty name="chat" property="*"/>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="chatStyle.css">
    <title>Chat</title>
</head>

<body style="
    padding-bottom: 15px;
    height: 350px;
    display: flex;
    overflow: auto;
    flex-direction: column;
    background-color: #0d0d0d;
    gap: 2rem;
    justify-content: top;
    align-items: top;
    flex: 1;">
    <% for(Message m: chat.getMessageList()) { %>
        <% if(m.getUsername().equals(request.getParameter("username"))) {%>
            <div class="chat-message-item", style="
                border-radius: 10px;
                padding: 10px 15px;
                align-self: flex-end;
                background-color: #333333;
                color: #e6e6e6;
                max-width: 85%;
                justify-content: right;">
                <div><%= m.getContent() %></div>
                <div, style="font-size: 8px; color: gray;"><%= m.getDateToString() %></div>
            </div>
        <% } else { %>
            <div class="chat-message-item out" style="
                background-color: #1a1a1a;
                align-self: flex-start;
                color: #e6e6e6;
                max-width: 85%;
                border-radius: 10px;
                padding: 10px 15px;">
                <div style="font-weight: bolder; font-size: 11px;"><%= m.getUsername() %></div>
                <div><%= m.getContent() %></div>
                <div, style="font-size: 8px; color: gray;"><%= m.getDateToString().toString() %></div>
            </div>
        <% } %>
    <% } %>
    <!-- <script>
        const chatBody = document.querySelector('.chat .chat-body');
        chatBody.scrollTop = chatBody.scrollHeight;
    </script> -->
    <script>
        window.scrollTo(0, 999999999);
    </script>
</body>