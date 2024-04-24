/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author hd
 */
public class UserDAO {
    private static final String LOGIN="SELECT fullName, role FROM tbl_User WHERE userID=? AND password=? ";
    private static final String SEARCH_LISTUSER = "SELECT userId, fullName, password, role FROM tbl_User WHERE fullName like ? OR userId = ?";
    private static final String GET_LISTALLUSER = "SELECT userID, fullName, password, role FROM tbl_User";
    private static final String UPDATE="UPDATE tbl_User SET fullName=?, password=?, role=? WHERE userId=?";
    private static final String INSERT = "INSERT INTO tbl_User(userId, fullName, password, role) VALUES (?, ?, ?, ?)";
    private static final String CHECK_DUPLICATE = "SELECT userId FROM tbl_User WHERE userId=?";
    private static final String DELETE="DELETE tbl_User WHERE userId = ?";
    
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user= null;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs= ptm.executeQuery();
                if(rs.next()){
                    String fullName= rs.getString("fullName");
                    int role= rs.getInt("role");
                    user= new UserDTO(userID, fullName, role, password);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return user;
    }
    public boolean deleteUser(String userId) throws SQLException {
        boolean checkDelete = false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, userId);
                checkDelete= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkDelete;
    }
    
    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean insertUser(UserDTO dto) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, dto.getUserID());
                ptm.setString(2, dto.getFullName());
                ptm.setString(3, dto.getPassword());
                ptm.setInt(4, dto.getRole());
                check = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
     public boolean updateUser(UserDTO dto) throws SQLException {
        boolean checkUpdate= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(UPDATE);
                ptm.setString(1, dto.getFullName());
                ptm.setString(2, dto.getPassword());
                ptm.setInt(3, dto.getRole());
                ptm.setString(4, dto.getUserID());
                checkUpdate= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkUpdate;
    }
    
    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_LISTUSER);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String userId = rs.getString("userId");
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    listUser.add(new UserDTO(userId, fullName, role, password));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listUser;
    }

    public List<UserDTO> getAllUsers() throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_LISTALLUSER);
            rs = ptm.executeQuery();
            while (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String password = rs.getString("password");
                    int role = rs.getInt("role");
                    listUser.add(new UserDTO(userID, fullName, role, password));
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listUser;
    }

}
