<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <h1>Tareas</h1>

        <form action="listas-tareas" method="post" >
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" name="usuario"
                       id="usuario" placeholder="Usuario">
                <div class="col">${ requestScope.msgErrorUsuario }</div>
            </div>
            <div class="form-group">
                <label for="pwd">Contraseña</label>
                <input type="password" class="form-control" name="pwd"
                       id="pwd" placeholder="Contraseña">
                <div class="col">${ requestScope.msgErrorPwd }</div>
            </div>
            <div class="container">              
                <button type="submit" class="btn btn-primary">Login (Ver listas)</button>
            </div>
        </form>

    </body>
</html>
