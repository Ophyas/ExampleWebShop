package javaWebStore.dao;

import javaWebStore.entity.Product;
import javaWebStore.model.PaginationResult;
import javaWebStore.model.ProductInfo;
 
public interface ProductDAO {
   
    public Product findProduct(String code);
    
    public ProductInfo findProductInfo(String code) ;
  
    
    public PaginationResult<ProductInfo> queryProducts(int page,
                       int maxResult, int maxNavigationPage, String category);
    
    public PaginationResult<ProductInfo> queryProducts(int page, int maxResult,
                       int maxNavigationPage, String likeName, String category);
 
    public void save(ProductInfo productInfo);
    
}
