
package com.tareas.model;

import com.tareas.excepciones.DBException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class DB {
    
    private static Map<Integer, Tarea> tareas;
    private static Set<Usuario> usuarios;

    static {
        tareas = new HashMap<Integer, Tarea>();
        tareas.put(1, new Tarea(1, "Hacer clases", "Mikel", "to do"));
        tareas.put(2, new Tarea(2, "Construir DB", "Mikel", "to do"));
        tareas.put(3, new Tarea(3, "Diseñar interfaz", "Laura", "to do"));
        tareas.put(4, new Tarea(4, "Estilos Css", "Laura", "to do"));
        
        tareas.put(5, new Tarea(5, "Escribir", "Mikel", "in progress"));
        tareas.put(6, new Tarea(6, "Dibujar", "Mikel", "done"));
        tareas.put(7, new Tarea(7, "Abrir paquete", "Laura", "in progress"));
        tareas.put(8, new Tarea(8, "Rematar", "Laura", "done"));
        

        usuarios = new HashSet<Usuario>();
        usuarios.add(new Usuario("Mikel", "1234"));
        usuarios.add(new Usuario("Laura", "1234"));
    }

    private DB() {
    }

    public synchronized static Collection<Tarea> getAllTareas() {
        return tareas.values();
    }

    public static Collection<Tarea> getTareasToDoDeUsuario(String nombreUsuario) {
        Set<Tarea> tareasToDoDeUsuario = new HashSet<Tarea>();
        for (Tarea t : tareas.values()) {
            if (t.getNombreUsuario().equals(nombreUsuario) && t.getEstado().equals("to do")) {
                tareasToDoDeUsuario.add(t);
            }
        }
        return tareasToDoDeUsuario;
    }    
    
    public static Collection<Tarea> getTareasInProgressDeUsuario(String nombreUsuario) {
        Set<Tarea> tareasInProgressDeUsuario = new HashSet<Tarea>();
        for (Tarea t : tareas.values()) {
            if (t.getNombreUsuario().equals(nombreUsuario) && t.getEstado().equals("in progress")) {
                tareasInProgressDeUsuario.add(t);
            }
        }
        return tareasInProgressDeUsuario;
    } 
    
    public static Collection<Tarea> getTareasDoneDeUsuario(String nombreUsuario) {
        Set<Tarea> tareasDoneDeUsuario = new HashSet<Tarea>();
        for (Tarea t : tareas.values()) {
            if (t.getNombreUsuario().equals(nombreUsuario) && t.getEstado().equals("done")) {
                tareasDoneDeUsuario.add(t);
            }
        }
        return tareasDoneDeUsuario;
    } 
    

    public synchronized static void altaTarea(Tarea tarea) throws DBException {
        if (tareas.containsKey(tarea.getId())) {
            throw new DBException("El libro ya existe con el id " + tarea.getId());
        }
        tareas.put(tarea.getId(), tarea);
    }

    public synchronized static Collection<Usuario> getUsuarios() {
        return usuarios;
    }

    public synchronized static void altaUsuario(Usuario u) throws DBException {
        boolean seAñade = usuarios.add(u);
        if (!seAñade) {
            throw new DBException("No ha sido añadido. Ya existe");
        }
    }
    
}
