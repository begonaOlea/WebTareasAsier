package com.tareas.web;

import com.tareas.excepciones.LoginException;
import com.tareas.servicios.LoginService;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ListasTareasServlet", urlPatterns = {"/listas-tareas"})
public class ListasTareasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String usuario = req.getParameter("usuario");
        String pwd = req.getParameter("pwd");

        String msgErrorUsuario = null;
        String msgErrorPwd = null;
        String msgErrorLogin = null;

        boolean valido = true;

        if (usuario == null || usuario.trim().length() == 0) {
            msgErrorUsuario = "Debe indicar un nombre de usuario";
            valido = false;
        }
     
        if (pwd == null || pwd.trim().length() == 0) {
            msgErrorPwd = "Debe indicar la clave";
            valido = false;
        }
        
        if (valido) {

            try {
                HttpSession sesion = req.getSession();
                LoginService servicio = new LoginService();
                servicio.login(usuario, pwd, sesion);

            } catch (LoginException ex) {
                msgErrorLogin = ex.getMessage();
                valido = false;
            }

        }

        String jspAMostrar = "";
        if (valido) {
            jspAMostrar = "listas-tareas.jsp";
            req.setAttribute("usuario", usuario);
            req.setAttribute("pwd", pwd);
        } else {
            jspAMostrar = "index.jsp";
            req.setAttribute("msgErrorUsuario", msgErrorUsuario);
            req.setAttribute("msgErrorPwd", msgErrorPwd);
            req.setAttribute("msgErrorLogin", msgErrorLogin);
        }
        
        RequestDispatcher rd = req.getRequestDispatcher(jspAMostrar);
        rd.forward(req, resp);

    }

}
