/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

/**
 *
 * @author hd
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private int role;
    private String password;

    public UserDTO() {
    }

    public UserDTO(String userID, String fullName, int role, String password) {
        this.userID = userID;
        this.fullName = fullName;
        this.role = role;
        this.password = password;
    }
    
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    
    
    
}
