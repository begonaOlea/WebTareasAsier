<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/vista/cabecera.jspf" %>

        <form action="listas-tareas" method="post" >
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" name="usuario"
                       id="usuario" placeholder="Usuario">
                <c:if test="${not empty requestScope.msgErrorUsuario }" >
                    <div class="alert alert-danger" role="alert">
                        ${ requestScope.msgErrorUsuario }
                    </div>
                </c:if>
            </div>
            <div class="form-group">
                <label for="pwd">Contraseña</label>
                <input type="password" class="form-control" name="pwd"
                       id="pwd" placeholder="Contraseña">
                <c:if test="${not empty requestScope.msgErrorPwd }" >
                    <div class="alert alert-danger" role="alert">
                        ${ requestScope.msgErrorPwd }
                    </div>
                </c:if>

            </div>
            <div class="container">              
                <button type="submit" class="btn btn-primary">Login (Ver listas)</button>
            </div>
        </form>

        <br>

        <c:if test="${not empty requestScope.msgErrorLogin }" >
            <div class="alert alert-danger" role="alert">
                ${requestScope.msgErrorLogin}
            </div>
        </c:if>

    </body>
</html>
