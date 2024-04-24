/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class WishListDAO {
    private static final String GET_WISHLIST = "SELECT w.mobileId, m.mobileName, m.price, m.description, m.yearOfProduction, m.notSale, m.image, m.category "
            + "FROM tbl_Wishlist w "
            + "JOIN tbl_Product m ON w.mobileId = m.mobileId "
            + "JOIN tbl_User u ON w.userId = u.userId "
            + "WHERE w.userId = ?";
    private static final String INSERT_WISHLIST = "INSERT INTO tbl_Wishlist(wishlistId, userId, mobileId) VALUES (?, ?, ?)";
    private static final String SELECT_WISHLIST = "SELECT * FROM tbl_Wishlist WHERE wishlistId = ? AND userId = ? AND mobileId = ?";
    private static final String GETWISHLISTID = "SELECT wishlistId FROM tbl_Wishlist where mobileId like ?";
    private static final String GETMAXWISHLISTID = "SELECT MAX(wishlistId) FROM tbl_Wishlist";
    private static final String REMOVEWISHLIST = "DELETE FROM tbl_Wishlist WHERE userId = ? AND mobileId = ?";
    
    public WishListDTO getUserWishlist(String userId) throws SQLException {
        WishListDTO wishList = new WishListDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GET_WISHLIST);
            ptm.setString(1, userId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String mobileId = rs.getString("mobileId");
                String mobileName = rs.getString("mobileName");
                String image = rs.getString("image");
                String category = rs.getString("category");
                String description = rs.getString("description");
                boolean notSale = rs.getBoolean("notSale");
                float price = rs.getFloat("price");
                int yearOfProduction = rs.getInt("yearOfProduction");
                if(notSale == false){
                wishList.add(new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, yearOfProduction, notSale, image, category));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return wishList;
    }
    
    public boolean removeWishList(String userId, String mobileId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(REMOVEWISHLIST);
            ptm.setString(1, userId);
            ptm.setString(2, mobileId);
            check = ptm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    
    public boolean addToWishlist(String userId, ProductDTO dto, int wishlistId) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_WISHLIST);
                ptm.setInt(1, wishlistId);
                ptm.setString(2, userId);
                ptm.setString(3, dto.getMobileId());
                rs = ptm.executeQuery();
                if (!rs.next()) {
                    ptm = conn.prepareStatement(INSERT_WISHLIST);
                    ptm.setInt(1, wishlistId);
                    ptm.setString(2, userId);
                    ptm.setString(3, dto.getMobileId());
                    checkInsert = ptm.executeUpdate() > 0;
                } 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkInsert;
    }
    
    public int getWishlistId(String mobileId) throws SQLException {
    int currentWishlistId = 0;
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            ptm = conn.prepareStatement(GETWISHLISTID);
            ptm.setString(1, mobileId);
            rs = ptm.executeQuery();
            if (rs.next()) {
                currentWishlistId = rs.getInt(1);
            }
        }
        if (currentWishlistId == 0) {
            ptm = conn.prepareStatement(GETMAXWISHLISTID);
            rs = ptm.executeQuery();
            if (rs.next()) {
                currentWishlistId = rs.getInt(1);
            }
            currentWishlistId++;
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
    return currentWishlistId;
}
}
