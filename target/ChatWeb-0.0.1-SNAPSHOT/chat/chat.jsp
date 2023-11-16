<%@ page import = "chat.ChatBean" %>
<%@ page import = "chat.Message" %>
<%@ page import = "java.net.URLEncoder" %>

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
    align-items: center;
    justify-content: center;">
    <% if(!chat.checkSession(request.getSession(false)) || request.getParameter("username") == null){ response.sendRedirect("../index.jsp"); } %>
    <% chat.setUsernameToHTTPSession(request.getSession(), request.getParameter("username")); %>
    <div class="chat">
        <div class="chat-header">
            <span><%= request.getParameter("username") %></span>
            <a href="../index.jsp">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-logout-2" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <path stroke=#e6e6e6 d="M10 8v-2a2 2 0 0 1 2 -2h7a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-7a2 2 0 0 1 -2 -2v-2"></path>
                    <path stroke=#e6e6e6 d="M15 12h-12l3 -3"></path>
                    <path stroke=#e6e6e6 d="M6 15l-3 -3"></path>
                </svg>
            </a>
        </div>
        <div class="chat-body" style="padding: 0;">
            <iframe frameborder="0" name="iframe" style="height: 100%;" src="chatpage.jsp?username=<%= chat.encodeURL(request.getParameter("username")) %>"> 
                Tu buscador no soporta Iframes
            </iframe>
        </div>
        <div class="chat-footer">
            <form action="chat.jsp" method="post">
                <label class="send-icon">
                    <input type="submit" value="" class="hide-submit">
                    <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-send" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                        <path stroke=#e6e6e6 d="M10 14l11 -11"></path>
                        <path stroke=#e6e6e6 d="M21 3l-6.5 18a.55 .55 0 0 1 -1 0l-3.5 -7l-7 -3.5a.55 .55 0 0 1 0 -1l18 -6.5"></path>
                    </svg>
                </label>
                <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
                <input class="input-message" type="text" placeholder="Escribe tu mensaje..." name="msg">
            </form>
        </div>
    </div>
    <script>
        setInterval(refreshIFrame, 5000);
        function refreshIFrame(){
            frames[0].location.reload(true);
        }
    </script>
</body>
</html>