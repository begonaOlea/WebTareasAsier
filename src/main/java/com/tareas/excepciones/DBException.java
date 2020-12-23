package com.tareas.excepciones;

public class DBException extends Exception{
    
    public DBException(String mensaje) {
        super(mensaje);
    }        
}