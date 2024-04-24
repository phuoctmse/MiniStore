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
public class WishListDTO {

    private int wishListId;
    private Map<String, ProductDTO> wishList;

    public WishListDTO() {
    }

    public WishListDTO(int wishListId, Map<String, ProductDTO> wishList) {
        this.wishListId = wishListId;
        this.wishList = wishList;
    }

    public int getWishListId() {
        return wishListId;
    }

    public void setWishListId(int wishListId) {
        this.wishListId = wishListId;
    }

    public Map<String, ProductDTO> getWishList() {
        return wishList;
    }

    public void setWishList(Map<String, ProductDTO> wishList) {
        this.wishList = wishList;
    }

    public boolean add(ProductDTO product) {
        boolean check = false;
        if (this.wishList == null) {
            this.wishList = new HashMap<>();
        }
        if (this.wishList.containsKey(product.getMobileId())) {
            return check;
        } else {
            this.wishList.put(product.getMobileId(), product);
            check = true;
        }
        return check;
    }

    public boolean remove(String mobileId) {
        boolean check = false;
        if (this.wishList != null) {
            if (this.wishList.containsKey(mobileId)) {
                this.wishList.remove(mobileId);
                check = true;
            }
        }
        return check;
    }
    
}
