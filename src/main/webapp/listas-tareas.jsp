<%@page import="com.tareas.model.DB"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Collection"%>
<%@page import="com.tareas.model.Tarea"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de tareas</title>
    </head>
    <body>
        <h1>Lista de tareas</h1>
        
         <div class="row">
                <div class="col">
                    <h1>Lista To Do</h1>                    
                    
                    <%
                        Collection<Tarea> tareas = DB.getTareasToDoDeUsuario(" ");
                    %>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Descripcion</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% for (Tarea t : tareas) {%>
                            <tr>
                                <th scope="row"><%= t.getId()%></th>
                                <td><%= t.getDescripcion()%></td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                    
                </div>
            </div>
        
        
        
        
    </body>
</html>
