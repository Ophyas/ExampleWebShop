package javaWebStore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import javaWebStore.dao.AccountDAO;
import javaWebStore.dao.OrderDAO;
import javaWebStore.dao.ProductDAO;
import javaWebStore.model.CustomerInfo;
import javaWebStore.model.OrderDetailInfo;
import javaWebStore.model.OrderInfo;
import javaWebStore.model.PaginationResult;
import javaWebStore.model.ProductInfo;
import javaWebStore.validator.ProductInfoValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
@Transactional
@EnableWebMvc
public class AdminController {
	
    @Autowired
    private OrderDAO orderDAO;
 
    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private AccountDAO accountDAO;
        
    @Autowired
    private ProductInfoValidator productInfoValidator;
 

    @SuppressWarnings("unused")
	@Autowired
    private ResourceBundleMessageSource messageSource;
    
 
    @InitBinder
    public void myInitBinder(WebDataBinder dataBinder) {
        Object target = dataBinder.getTarget();
        if (target == null) {
            return;
        }
        System.out.println("Target=" + target);
 
        if (target.getClass() == ProductInfo.class) {
            dataBinder.setValidator(productInfoValidator);
            dataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());
        }
    }
   
 
    @RequestMapping(value = { "/login" }, method = RequestMethod.GET)
    public String login(Model model, HttpSession session) {
    	
    	if(session != null) {
    		CustomerInfo customer = (CustomerInfo) session.getAttribute("myAccount");
    		model.addAttribute("customerForm", customer);
    	}
    	
    	model.addAttribute("customerForm", new CustomerInfo());
        return "/login";
    }
    
    @RequestMapping(value = { "/register" }, method = RequestMethod.GET)
    public String register(Model model) {
    	
    	CustomerInfo info = new CustomerInfo();
    	model.addAttribute("customerForm", info);  
        return "register";
    }
    
    @RequestMapping(value = { "/register" }, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String register(HttpSession session,
            Model model,
            @ModelAttribute("customerForm") CustomerInfo customerForm,
            BindingResult result,
            final RedirectAttributes redirectAttributes) {


        try {
            accountDAO.save(customerForm);
            session.setAttribute("myAccount", customerForm);
            model.addAttribute("customerForm", customerForm);
            
        } catch (Exception e) {
        	System.out.println("Error");
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "index";
 
        }
        return "login";
    }
     
 
    @RequestMapping(value = { "/accountInfo" }, method = RequestMethod.GET)
    public String accountInfo(Model model) {
 
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 
        model.addAttribute("userDetails", userDetails);
        return "accountInfo";
    }
 
    @RequestMapping(value = { "/orderList" }, method = RequestMethod.GET)
    public String orderList(Model model,
            @RequestParam(value = "page", defaultValue = "1") String pageStr, HttpSession session) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (Exception e) {
        }
        final int MAX_RESULT = 5;
        final int MAX_NAVIGATION_PAGE = 10;
 
        PaginationResult<OrderInfo> paginationResult //
        = orderDAO.listOrderInfo(page, MAX_RESULT, MAX_NAVIGATION_PAGE);
 
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = userDetails.getUsername();
        model.addAttribute("username", username);
        model.addAttribute("paginationResult", paginationResult);
        return "orderList";
    }
 
    @RequestMapping(value = { "/product" }, method = RequestMethod.GET)
    public String product(Model model, @RequestParam(value = "code", defaultValue = "") String code) {
        ProductInfo productInfo = null;
 
        if (code != null && code.length() > 0) {
            productInfo = productDAO.findProductInfo(code);
        }
        if (productInfo == null) {
            productInfo = new ProductInfo();
            productInfo.setNewProduct(true);
        }
        model.addAttribute("productForm", productInfo);
        return "product";
    }
 
    @RequestMapping(value = { "/product" }, method = RequestMethod.POST)
    @Transactional(propagation = Propagation.NEVER)
    public String productSave(Model model,
            @ModelAttribute("productForm") @Validated ProductInfo productInfo,
            BindingResult result,
            final RedirectAttributes redirectAttributes) {
 
        if (result.hasErrors()) {
            return "product";
        }
        try {
            productDAO.save(productInfo);
        } catch (Exception e) {
            String message = e.getMessage();
            model.addAttribute("message", message);
            return "product";
 
        }
        return "redirect:/product";
    }
 
    @RequestMapping(value = { "/order" }, method = RequestMethod.GET)
    public String orderView(Model model, @RequestParam("orderId") String orderId) {
        OrderInfo orderInfo = null;
        if (orderId != null) {
            orderInfo = this.orderDAO.getOrderInfo(orderId);
        }
        if (orderInfo == null) {
            return "redirect:/orderList";
        }
        List<OrderDetailInfo> details = this.orderDAO.listOrderDetailInfos(orderId);
        orderInfo.setDetails(details);
 
        model.addAttribute("orderInfo", orderInfo);
 
        return "order";
    }
    
}
