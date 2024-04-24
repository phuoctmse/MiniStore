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
public class CartDAO {

    private static final String SELECT_CART = "SELECT quantity FROM tbl_Cart WHERE cartId = ? AND userId = ? AND mobileId = ?";
    private static final String UPDATE_CART = "UPDATE tbl_Cart SET quantity = ? WHERE cartId = ? AND userId = ? AND mobileId = ?";
    private static final String INSERT_CART = "INSERT INTO tbl_Cart (cartId ,userId, mobileId, quantity) VALUES (? ,?, ?, ?)";
    private static final String GETCARTID = "SELECT cartId FROM tbl_Cart where mobileId like ?";
    private static final String GETMAXCARTID = "SELECT MAX(cartId) FROM tbl_Cart";
    private static final String GETCART = "SELECT c.mobileId, c.quantity, m.mobileName, m.price, m.description, m.yearOfProduction,m.notSale, m.image, m.category "
            + "FROM tbl_Cart c "
            + "JOIN tbl_Product m ON c.mobileId = m.mobileId "
            + "JOIN tbl_User u ON c.userId = u.userId "
            + "WHERE c.userId = ?";
    private static final String REMOVECART = "DELETE FROM tbl_Cart WHERE userId = ? AND mobileId = ?";
    private static final String EDITCART = "UPDATE tbl_Cart SET quantity = ? WHERE userId = ? AND mobileId = ?";
    private static final String CHECKCARTID = "SELECT cartId FROM tbl_Cart where mobileId like ?";

    public int getCartId(String mobileId) throws SQLException {
        int currentCartId = 0;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETCARTID);
                ptm.setString(1, mobileId);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    currentCartId = rs.getInt(1);
                }
            }
            if (currentCartId == 0) {
                ptm = conn.prepareStatement(GETMAXCARTID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    currentCartId = rs.getInt(1);
                }
                currentCartId++;
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
        return currentCartId;
    }

    public boolean addToCart(String userId, ProductDTO dto, int cartId) throws SQLException {
        boolean checkInsert = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SELECT_CART);
                ptm.setInt(1, cartId);
                ptm.setString(2, userId);
                ptm.setString(3, dto.getMobileId());
                ResultSet rs = ptm.executeQuery();
                if (rs.next()) {
                    ptm = conn.prepareStatement(UPDATE_CART);
                    ptm.setInt(1, rs.getInt("quantity") + dto.getQuantity()); 
                    ptm.setInt(2, cartId);
                    ptm.setString(3, userId);
                    ptm.setString(4, dto.getMobileId());
                } else {
                    
                    ptm = conn.prepareStatement(INSERT_CART);
                    ptm.setInt(1, cartId);
                    ptm.setString(2, userId);
                    ptm.setString(3, dto.getMobileId());
                    ptm.setInt(4, dto.getQuantity());
                }
                checkInsert = ptm.executeUpdate() > 0 ? true : false;
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

    public CartDTO getUserCart(String userId) throws SQLException {
        CartDTO cart = new CartDTO();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GETCART);
            ptm.setString(1, userId);
            rs = ptm.executeQuery();
            while (rs.next()) {
                String mobileId = rs.getString("mobileId");
                String mobileName = rs.getString("mobileName");
                String image = rs.getString("image");
                String category = rs.getString("category");
                int quantity = rs.getInt("quantity");
                String description = rs.getString("description");
                boolean notSale = rs.getBoolean("notSale");
                float price = rs.getFloat("price");
                int yearOfProduction = rs.getInt("yearOfProduction");
                ProductDTO product = new ProductDTO();
                product.setMobileId(mobileId);
                product.setQuantity(quantity);
                product.setDescription(description);
                product.setMobileName(mobileName);
                product.setPrice(price);
                product.setYearOfProduction(yearOfProduction);
                product.setCategory(category);
                product.setImage(image);
                product.setNotSale(notSale);
                cart.add(product);
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
        return cart;
    }

    public boolean removeCart(String userId, String mobileId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(REMOVECART);
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

    public boolean editCart(String userId, String mobileId, int quantity) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(EDITCART);
            ptm.setInt(1, quantity);
            ptm.setString(2, userId);
            ptm.setString(3, mobileId);
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

    public boolean checkCartId(String checkMobileIdExist) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECKCARTID);
                ptm.setString(1, checkMobileIdExist);
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
}
