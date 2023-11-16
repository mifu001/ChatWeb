<%@ page import = "chat.ChatBean" %>

<jsp:useBean id="chat" class="chat.ChatBean" scope="session"/>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
    <% chat.addUser(request.getSession(true)); %>
    <div class="login">
        <div class="login-form">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-messages" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                <path stroke="#e6e6e6" d="M21 14l-3 -3h-7a1 1 0 0 1 -1 -1v-6a1 1 0 0 1 1 -1h9a1 1 0 0 1 1 1v10"></path>
                <path stroke="#e6e6e6" d="M14 15v2a1 1 0 0 1 -1 1h-7l-3 3v-10a1 1 0 0 1 1 -1h2"></path>
            </svg>
            <form action="./chat/chat.jsp" method="post">
                <div class="login-form-item">
                    <input type="text" placeholder="Nombre de usuario" name="username" required>
                </div>
                <div class="login-form-item">
                    <button type="submit">Entrar</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>