package javaWebStore.dao;

import java.util.List;

import javaWebStore.model.CartInfo;
import javaWebStore.model.OrderDetailInfo;
import javaWebStore.model.OrderInfo;
import javaWebStore.model.PaginationResult;
 
public interface OrderDAO {
 
    public void saveOrder(CartInfo cartInfo);
 
    public PaginationResult<OrderInfo> listOrderInfo(int page,
            int maxResult, int maxNavigationPage);
    
    public OrderInfo getOrderInfo(String orderId);
    
    public List<OrderDetailInfo> listOrderDetailInfos(String orderId);
 
}
