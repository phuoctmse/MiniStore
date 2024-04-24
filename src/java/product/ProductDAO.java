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
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductDAO {
    private static final String SEARCH="SELECT * FROM tbl_Product WHERE mobileId = ? OR mobileName like ?";
    private static final String GETSAMPLE = "SELECT TOP 1 * FROM tbl_Product";
    private static final String DELETE="DELETE tbl_Product WHERE mobileId = ?";
    private static final String UPDATE="UPDATE tbl_Product SET price=?, description=?, quantity=?, notSale=?, category=?,yearOfProduction=?,mobileName=? WHERE mobileId=?";
    private static final String INSERT="INSERT INTO tbl_Product(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image, category) " + "VALUES(?,?,?,?,?,?,?,?,?)";
    private static final String GETLISTBYPRICE="SELECT * FROM tbl_Product WHERE price BETWEEN ? AND ?";
    private static final String GETLISTBYNAME="SELECT * FROM tbl_Product WHERE mobileName like ?";
    private static final String GETPRODUCTID="SELECT * FROM tbl_Product WHERE mobileId = ?";
    private static final String GETLISTALLPRODUCT = "SELECT * FROM tbl_Product";
    private static final String GETDESCRIPTION = "SELECT * from tbl_Product WHERE description like ?";
    private static final String CHECK_DUPLICATE = "SELECT mobileId FROM tbl_Product WHERE mobileId=?";
    private static final String GETLISTBYCATEGORY = "SELECT * FROM tbl_Product WHERE category LIKE ?;";
    private static final String GETTOP8 = "WITH CategorizedProducts AS ( " +
                     "    SELECT *, " +
                     "           ROW_NUMBER() OVER (PARTITION BY [category] ORDER BY (SELECT NULL)) AS RowNum, " +
                     "           COUNT(*) OVER (PARTITION BY [category]) AS CategoryCount " +
                     "    FROM [workshop1].[dbo].[tbl_Product] " +
                     ") " +
                     "SELECT TOP 8 * " +
                     "FROM CategorizedProducts " +
                     "WHERE RowNum <= 2 " +
                     "      AND CategoryCount >= 2 " +
                     "ORDER BY [category], RowNum;";
    
    private static final String GETTOP4 = "WITH CategorizedProducts AS ( " +
                     "    SELECT *, " +
                     "           ROW_NUMBER() OVER (PARTITION BY [category] ORDER BY [mobileId]) AS RowNum " +
                     "    FROM [workshop1].[dbo].[tbl_Product] " +
                     ") " +
                     "SELECT TOP 4 * " +
                     "FROM CategorizedProducts " +
                     "WHERE RowNum = 1;"; 

    public boolean checkDuplicate(String mobileId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, mobileId);
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
    
    public List<ProductDTO> getTop4Products() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETTOP4);
            rs = ptm.executeQuery();
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    listProduct.add(dto);
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }
    
    public List<ProductDTO> getTop8Products() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETTOP8);
            rs = ptm.executeQuery();
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    listProduct.add(dto);
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }
    
    public List<ProductDTO> getListProduct(String search) throws SQLException {
        List<ProductDTO> list= new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                ptm.setString(2, "%" + search + "%");
                rs= ptm.executeQuery();
                while(rs.next()){
                    String mobileId= rs.getString("mobileId");
                    String mobileName= rs.getString("mobileName");
                    String description= rs.getString("description");
                    float price = rs.getFloat("price");
                    int yearOfProduction= rs.getInt("yearOfProduction");
                    int quantity= rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    list.add(new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image, category));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return list;
    }
    
    public List<ProductDTO> getListCategory(String search) throws SQLException {
        List<ProductDTO> list= new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(GETLISTBYCATEGORY);
                ptm.setString(1, search);
                rs= ptm.executeQuery();
                while(rs.next()){
                    String mobileId= rs.getString("mobileId");
                    String mobileName= rs.getString("mobileName");
                    String description= rs.getString("description");
                    float price = rs.getFloat("price");
                    int yearOfProduction= rs.getInt("yearOfProduction");
                    int quantity= rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    if(notSale == false){
                    list.add(new ProductDTO(mobileId, description, price, mobileName, yearOfProduction, quantity, notSale, image, category));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return list;
    }

    public boolean delete(String mobileId) throws SQLException {
        boolean checkDelete = false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(DELETE);
                ptm.setString(1, mobileId);
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

    public boolean update(ProductDTO dto) throws SQLException {
        boolean checkUpdate= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(UPDATE);
                ptm.setFloat(1, dto.getPrice());
                ptm.setString(2, dto.getDescription());
                ptm.setInt(3, dto.getQuantity());
                ptm.setBoolean(4, dto.isNotSale());
                ptm.setString(5, dto.getCategory());
                ptm.setInt(6, dto.getYearOfProduction());
                ptm.setString(7, dto.getMobileName());
                ptm.setString(8, dto.getMobileId());
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

    public boolean insert(ProductDTO dto) throws SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, dto.getMobileId());
                ptm.setString(2, dto.getDescription());
                ptm.setFloat(3, dto.getPrice());
                ptm.setString(4, dto.getMobileName());
                 ptm.setInt(5, dto.getYearOfProduction());
                  ptm.setInt(6, dto.getQuantity());
                   ptm.setBoolean(7, dto.isNotSale());
                  ptm.setString(8, dto.getImage());
                  ptm.setString(9, dto.getCategory());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }

    public List<ProductDTO> getListProductByPrice(float fromPrice, float toPrice) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETLISTBYPRICE);
            ptm.setFloat(1, fromPrice);
            ptm.setFloat(2, toPrice);
            rs = ptm.executeQuery();
            
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    if(dto.isNotSale() == false){
                    listProduct.add(dto);
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }
    
    public List<ProductDTO> getListProductByName(String mobileName) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETLISTBYNAME);
            ptm.setString(1,"%" + mobileName + "%");
            rs = ptm.executeQuery();
            
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    if(dto.isNotSale() == false){
                    listProduct.add(dto);
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }
    
    public List<ProductDTO> getAllProducts() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETLISTALLPRODUCT);
            rs = ptm.executeQuery();
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    if(notSale == false){
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    listProduct.add(dto);
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }

    public List<ProductDTO> getAllByIdAndName(String searchCart) throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETDESCRIPTION);
            ptm.setString(1, "%" + searchCart + "%");
            rs = ptm.executeQuery();
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    ProductDTO dto = new ProductDTO(id, description, price, name, yearOfProduction, quantity, notSale, image, category);
                    if(dto.isNotSale() == false){
                    listProduct.add(dto);
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return listProduct;
    }

    public ProductDTO getProductId(String mobileId) throws SQLException {
        ProductDTO dto = new ProductDTO();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETPRODUCTID);
            ptm.setString(1,mobileId);
            rs = ptm.executeQuery();
            
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    dto.setMobileId(id);
                    dto.setMobileName(name);
                    dto.setDescription(description);
                    dto.setPrice(price);
                    dto.setQuantity(quantity);
                    dto.setYearOfProduction(yearOfProduction);
                    dto.setCategory(category);
                    dto.setNotSale(notSale);
                    dto.setImage(image);
                    if(dto.isNotSale()){
                    dto = new ProductDTO();
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return dto;
    }

    public ProductDTO getSample() throws SQLException {
        ProductDTO dto = new ProductDTO();
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs = null;
        try {
            conn= DBUtils.getConnection();
            ptm = conn.prepareStatement(GETSAMPLE);
            rs = ptm.executeQuery();
            
            while (rs.next()) {
                    String id = rs.getString("mobileId");
                    String name = rs.getString("mobileName");
                    float price = rs.getFloat("price");
                    String description = rs.getString("description");
                    int yearOfProduction = rs.getInt("yearOfProduction");
                    int quantity = rs.getInt("quantity");
                    boolean notSale = rs.getBoolean("notSale");
                    String image = rs.getString("image");
                    String category = rs.getString("category");
                    dto.setMobileId(id);
                    dto.setMobileName(name);
                    dto.setDescription(description);
                    dto.setPrice(price);
                    dto.setQuantity(quantity);
                    dto.setYearOfProduction(yearOfProduction);
                    dto.setCategory(category);
                    dto.setNotSale(notSale);
                    dto.setImage(image);
                    if(dto.isNotSale()){
                    dto = new ProductDTO();
                    }
                }
        } catch (Exception e) {
            e.printStackTrace();
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
            if(rs!= null) rs.close();
        }
        return dto;
    }
}
