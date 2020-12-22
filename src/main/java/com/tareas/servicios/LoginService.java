package com.tareas.servicios;

import com.tareas.excepciones.LoginException;
import com.tareas.model.DB;
import com.tareas.model.Usuario;
import java.util.Collection;
import javax.servlet.http.HttpSession;

public class LoginService {
    
    public void login(String nombreUsuario, String clave, HttpSession sesion) throws LoginException{
        // DB ver si existe y coincide email/clave
        
        Collection <Usuario> usuarios = DB.getUsuarios();
        Usuario usrEncontrado = null;
        for(Usuario u : usuarios){
            if(u.getNombreUsuario().equals(nombreUsuario)){
                usrEncontrado = u;
                break;
            }
        }
        
        //si existe añadir a sesion
        //si no existe lanzo excepcion
        
        if(usrEncontrado ==  null){
            throw new LoginException("El usuario no existe. Debe registrarse");
        } else {
            //ver si clave ok
            if (usrEncontrado.getPassword().equals(clave)){
                //añadir a sesion
                sesion.setAttribute("usuario", usrEncontrado);
            } else {
                throw new LoginException("Clave no válida");
            }
        }
  
        
    }
    
    public void logout(HttpSession sesion){
        sesion.invalidate();
    }
    
}
