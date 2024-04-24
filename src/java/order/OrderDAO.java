/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import product.CartDTO;
import product.ProductDTO;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class OrderDAO {

    private static final String GETMAXORDERID = "SELECT MAX(orderId) FROM tbl_Order";
    private static final String CHECK_QUANTITY = "SELECT quantity FROM tbl_Product WHERE mobileId = ?";
    private static final String INSERT_ORDER = "INSERT INTO tbl_Order(orderId, userId, fullName, phoneNumber, address, email) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String INSERT_ORDERDETAIL = "INSERT INTO tbl_OrderDetail(orderId, mobileId, quantity, price) VALUES(?, ?, ?, ?)";
    private static final String UPDATE_QUANTITY = "UPDATE tbl_Product SET quantity = quantity - ? WHERE mobileId = ?";
    private static final String GETALLORDERS = "SELECT * FROM tbl_Order";
    private static final String SEARCH_ORDER = "SELECT orderId, userId, fullName, phoneNumber, address, email FROM tbl_Order WHERE userId like ?";
    
    public List<OrderDTO> searchOrder(String search) throws SQLException {
    List<OrderDTO> listOrder = new ArrayList<>();
    Connection conn = null;
    PreparedStatement ptm = null;
    ResultSet rs = null;
    try {
        conn = DBUtils.getConnection();
        if (conn != null) {
            ptm = conn.prepareStatement(SEARCH_ORDER);
            ptm.setString(1, "%" + search + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderId");
                String userID = rs.getString("userId");
                String fullName = rs.getString("fullName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String email = rs.getString("email");
                listOrder.add(new OrderDTO(orderID, userID, fullName, phoneNumber, address, email));
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
    return listOrder;
}

    public List<OrderDTO> getAllOrders() throws SQLException {
        List<OrderDTO> listOrder = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            ptm = conn.prepareStatement(GETALLORDERS);
            rs = ptm.executeQuery();
            while (rs.next()) {
                int orderID = rs.getInt("orderId");
                String userID = rs.getString("userId");
                String fullName = rs.getString("fullName");
                String phoneNumber = rs.getString("phoneNumber");
                String address = rs.getString("address");
                String email = rs.getString("email");
                listOrder.add(new OrderDTO(orderID, userID, fullName, phoneNumber, address, email));
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
        return listOrder;
    }

    public boolean updateProductQuantity(CartDTO cart) throws ClassNotFoundException, SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE_QUANTITY);
                for (ProductDTO item : cart.getCart().values()) {
                    ptm.setInt(1, item.getQuantity());
                    ptm.setString(2, item.getMobileId());
                    check = ptm.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) {
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

    public boolean insertOrderDetails(int orderId, CartDTO cart) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDERDETAIL);
                for (ProductDTO item : cart.getCart().values()) {
                    ptm.setInt(1, orderId);
                    ptm.setString(2, item.getMobileId());
                    ptm.setInt(3, item.getQuantity());
                    ptm.setDouble(4, item.getPrice());
                    check = ptm.executeUpdate() > 0;
                }
            }
        } catch (SQLException e) {
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

    public boolean insertOrder(OrderDTO order) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setInt(1, order.getOrderID());
                ptm.setString(2, order.getUserID());
                ptm.setString(3, order.getFullName());
                ptm.setString(4, order.getPhoneNumber());
                ptm.setString(5, order.getAddress());
                ptm.setString(6, order.getEmail());
                check = ptm.executeUpdate() > 0;
            }

        } catch (SQLException e) {
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

    public int getOrderId() throws SQLException {
        int currentOrderId = 1;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(GETMAXORDERID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    currentOrderId = rs.getInt(1) + 1;
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
        return currentOrderId;
    }

    public List<ProductDTO> checkQuantity(CartDTO cart) throws SQLException, ClassNotFoundException {
        List<ProductDTO> exceededProducts = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_QUANTITY);
                for (ProductDTO item : cart.getCart().values()) {
                    ptm.setString(1, item.getMobileId());
                    ResultSet rs = ptm.executeQuery();
                    if (rs.next()) {
                        int availableQuantity = rs.getInt("quantity");
                        if (item.getQuantity() < availableQuantity) {
                            exceededProducts.add(item);
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return exceededProducts;
    }
}
