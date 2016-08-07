/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Models;

import java.io.Serializable;
import java.util.ArrayList;

/**
 *
 * @author Darren
 */
public class User implements Serializable{
    private int userID, type;
    private String username, password, name;

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the username to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }
    
    /**
     * @param username the username to set
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * @return the name
     */
    public String getFullname() {
        return name;
    }
    
    /**
     * @param name the username to set
     */
    public void setFullName(String name) {
        this.name = name;
    }
    
    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the name to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the type
     */
    public int getType() {
        return type;
    }

    /**
     * @param type the unit to set
     */
    public void setType(int type) {
        this.type = type;
    }
}
