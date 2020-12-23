package com.tareas.web;

import com.tareas.excepciones.CambioEstadoException;
import com.tareas.model.DB;
import com.tareas.model.Tarea;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CambiarEstadoServlet", urlPatterns = {"/cambiar-estado"})
public class CambiarEstadoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String sId = req.getParameter("id");
        String usuario = req.getParameter("usuario");
        String mensaje = null;
        String subirOBajar = req.getParameter("subirOBajar");
        String estado = null;

        int id = 0;
        if (sId == null || sId.trim().length() == 0) {
            mensaje = "Debe indicar el  id de la tarea a cambiar";
        } else {
            try {
                id = Integer.parseInt(sId);
            } catch (NumberFormatException e) {
                mensaje = "Debe indicar un id de tarea con formato número entero";
            }
        }

        if (usuario == null || usuario.trim().length() == 0) {
            mensaje = "Debe indicar un nombre de usuario";
        }

        if (mensaje == null) {
            Tarea t = DB.getTareaPorId(id);
            mensaje = "cambio de estado realizado";
            
            if (subirOBajar.equals("subir")){
                if (t.getEstado().equals("to do")) {
                            estado = "in progress";
                }
                if (t.getEstado().equals("in progress"))
                            estado = "done";                            
                    }
            
            if (subirOBajar.equals("bajar")){
                if (t.getEstado().equals("in progress")) {
                            estado = "to do";
                }
                if (t.getEstado().equals("done"))
                            estado = "in progress";                            
                    }

            DB.cambiarEstado(t, estado);           

        }

        RequestDispatcher rd = req.getRequestDispatcher("listas-tareas.jsp");
        req.setAttribute("usuario", usuario);
        req.setAttribute("mensaje", mensaje);
        rd.forward(req, resp);

    }

}
