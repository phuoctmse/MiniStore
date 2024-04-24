/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package product;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class CartDTO {
    
    private Map<String, ProductDTO> cart;
    private int cartId;

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public CartDTO() {
    }
    
    public CartDTO(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    
    public boolean add(ProductDTO product) {
        boolean check = false;
        if(this.cart == null) {
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(product.getMobileId())) {
            int currentQuantity = this.cart.get(product.getMobileId()).getQuantity();
            product.setQuantity(currentQuantity+ product.getQuantity());
        }
        this.cart.put(product.getMobileId(), product);
        check = true;
        return check;
    }
    
    public boolean remove(String mobileId) {
        boolean check = false;
        if(this.cart != null) {
            if(this.cart.containsKey(mobileId)){
                this.cart.remove(mobileId);
                check = true;
            }
        }
        return check;
    }
    
    public boolean edit(String mobileId, ProductDTO product) {
        boolean check = false;
        if(this.cart != null) {
            if(this.cart.containsKey(mobileId)){
                this.cart.replace(mobileId, product);
                check = true;
            }
        }
        return check;
    }
    
    public void emptyCart(CartDTO cart) {
    cart.getCart().clear();
    }
}
