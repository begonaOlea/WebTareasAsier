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
    </head>
    <body>
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
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Tarea t : tareasToDo) {%>
                            <tr>
                                <th scope="row"><%= t.getId()%></th>
                                <td><%= t.getDescripcion()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

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
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                    <hr/>

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
                            </tr>
                            <% }%>
                        </tbody>
                    </table>

                </div>
            </div>
                        
             
        </div>


    </body>
</html>







