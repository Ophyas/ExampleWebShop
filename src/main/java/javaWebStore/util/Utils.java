package javaWebStore.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import javaWebStore.model.CartInfo;
import javaWebStore.model.CustomerInfo;
 
public class Utils {
 
    public static CartInfo getCartInSession(HttpServletRequest request) {
 
        CartInfo cartInfo = (CartInfo) request.getSession().getAttribute("myCart");
        
        if (cartInfo == null) {
            cartInfo = new CartInfo();
            
            request.getSession().setAttribute("myCart", cartInfo);
        }
 
        return cartInfo;
    }
    
    public static CustomerInfo getAccountInSession(HttpSession request) {
    	 
        CustomerInfo customerInfo = (CustomerInfo) request.getAttribute("myAccount");
    
        if (customerInfo == null) {
        	customerInfo = new CustomerInfo();
            
            request.setAttribute("myAccount", customerInfo);
        }
 
        return customerInfo;
    }
 
    public static void removeCartInSession(HttpServletRequest request) {
        request.getSession().removeAttribute("myCart");
    }
 
    public static void storeLastOrderedCartInSession(HttpServletRequest request, CartInfo cartInfo) {
        request.getSession().setAttribute("lastOrderedCart", cartInfo);
    }
    
    public static CartInfo getLastOrderedCartInSession(HttpServletRequest request) {
        return (CartInfo) request.getSession().getAttribute("lastOrderedCart");
    }
 
}
