<%@page import="com.tareas.model.DB"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Collection"%>
<%@page import="com.tareas.model.Tarea"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tareas</title>
        <%@include file="WEB-INF/vista/estilos.jspf" %>
    </head>
    <body>

        <%@include file="WEB-INF/vista/cabecera.jspf" %>

        <div class="container">

            <div class="row">
                <div class="col">

                    <%
                        String usuario = (String) request.getAttribute("usuario");
                        Collection<Tarea> tareasToDo = DB.getTareasToDoDeUsuario(usuario);
                        Collection<Tarea> tareasInProgress = DB.getTareasInProgressDeUsuario(usuario);
                        Collection<Tarea> tareasDone = DB.getTareasDoneDeUsuario(usuario);
                    %>

                    <h1>Tareas de <%= usuario%></h1> 

                    <hr/>

                    <h3>Lista To Do</h3> 

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Descripcion</th>
                                <th scope="col">Subir Estado</th>
                                <th scope="col">Bajar Estado</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Tarea t : tareasToDo) {%>
                            <tr>
                                <th scope="row"><%= t.getId()%></th>
                                <td><%= t.getDescripcion()%></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=subir" > --> </a></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=bajar" > <-- </a></td>

                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                    <br>

                    <button type="button" class="btn btn-info" > --> </button>

                    <hr />

                    <h3>Lista In Progress</h3> 

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Descripcion</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Tarea t : tareasInProgress) {%>
                            <tr>
                                <th scope="row"><%= t.getId()%></th>
                                <td><%= t.getDescripcion()%></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=subir" > --> </a></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=bajar" > <-- </a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                    <hr />

                    <button type="button" class="btn btn-info"> --> </button>

                    <hr />

                    <h3>Lista Done</h3> 

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Descripcion</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Tarea t : tareasDone) {%>
                            <tr>
                                <th scope="row"><%= t.getId()%></th>
                                <td><%= t.getDescripcion()%></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=subir" > --> </a></td>
                                <td><a href="cambiar-estado?id=<%= t.getId()%>&usuario=<%=usuario%>&subirOBajar=bajar" > <-- </a></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                    <hr />

                    <button type="button" class="btn btn-info"> --> </button>


                    <hr />

                </div>
            </div>

        </div>

    </body>
</html>







