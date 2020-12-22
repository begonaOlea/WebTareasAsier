package com.tareas.model;

import java.io.Serializable;
import java.util.Objects;

public class Usuario implements Serializable{
    
    private String nombreUsuario;
    private String password;

    public Usuario(String email, String password) {
        this.nombreUsuario = email;
        this.password = password;
    }

    public String getEmail() {
        return nombreUsuario;
    }

    public void setEmail(String email) {
        this.nombreUsuario = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 19 * hash + Objects.hashCode(this.nombreUsuario);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Usuario other = (Usuario) obj;
        if (!Objects.equals(this.nombreUsuario, other.nombreUsuario)) {
            return false;
        }
        return true;
    } 
    
}