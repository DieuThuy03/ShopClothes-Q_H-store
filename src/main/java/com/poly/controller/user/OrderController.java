package com.poly.controller.user;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import com.poly.dao.ImageProductDao;
import com.poly.dao.ProductDetailDao;
import com.poly.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDao;
import com.poly.dao.OrderDetailDao;
import com.poly.service.OrderDetailService;
import com.poly.service.OrderService;

@Controller
public class OrderController {
	@Autowired
	OrderService orderService;
	@Autowired
	OrderDetailService orderDetailService;
	@Autowired
	OrderDao odao;
	@Autowired
	JavaMailSender javaMailSender;

	@Autowired
	OrderDetailDao orderDetailDao;

	@Autowired
	private ImageProductDao imageProductDao;

	@Autowired
	private ProductDetailDao productDetailDao;

	public void updateInformationProduct(Product product, ProductDetail detail , List<ImageProduct> images){
		if(detail!=null){
			product.setDetail(detail.getDetail());
			product.setDescription(detail.getDescription());
			product.setChip(detail.getChip());
			product.setRam(detail.getRam());
			product.setRom(detail.getRom());
			product.setResolution(detail.getResolution());
			product.setPin(detail.getPin());
		}
		for(int i = 0 ; i <images.size();i++){
			if(i==0) product.setImage1(images.get(0).getPath());
			if(i==1) product.setImage2(images.get(1).getPath());
			if(i==2) product.setImage3(images.get(2).getPath());
			if(i==3) product.setImage4(images.get(3).getPath());
			if(i==4) product.setImage5(images.get(4).getPath());
			if(i==5) product.setImage6(images.get(5).getPath());
			if(i==6) product.setImage7(images.get(6).getPath());
		}

	}


	@RequestMapping("/order/sell")
	public String sell( Model model) {
//		model.addAttribute("order", orderService.findById(id));
		return "user/order/detail";
	}

	@RequestMapping("/order/checkout")
	public String checkout() {
		return "user/order/checkout";
	}
	@RequestMapping("/order/list")
	public String list(Model model , HttpServletRequest request, @RequestParam("page") Optional<Integer> page) {
		
		String username= request.getRemoteUser();
		model.addAttribute("orders", orderService.findByUsername(username));
		return "user/order/list";
	}
	
	@RequestMapping("/order/detail/{id}")
	public String detail(@PathVariable("id") Integer id , Model model) {
		Order order = orderService.findById(id);
		if(order!=null){
			List<OrderDetail> details = order.getOrderDetails().stream()
					.map(item -> {
						Product product = item.getProduct();
						ProductDetail detail = productDetailDao.findByProductID(product.getProduct_id());
						List<ImageProduct> images = imageProductDao.findByProductID(product.getProduct_id());
						this.updateInformationProduct(product, detail, images);
						return  item;
					})
					.collect(Collectors.toList());
			order.setOrderDetails(details);
		}
		model.addAttribute("order",order );
		return "user/order/detail";
	}
	
	@RequestMapping("/order/remove")
	public String remove(@RequestParam("order_id") Integer id) {
//		int id_order = Integer.parseInt(id);
		Order order = odao.getById(id);
		order.setStatus(4);
		odao.save(order);
		return "redirect:/order/list";
	}
	@RequestMapping("/send")
	public String sendMail(@RequestParam("to") String to, @RequestParam("subject") String subject, @RequestParam("content") String content,
			@ModelAttribute("order") Order order) {
		SimpleMailMessage msg = new SimpleMailMessage();
		msg.setTo(to);
		msg.setText(
				"Tên người đặt hàng : " 
		+ content 
		+ "\n"
		+ "Phương thức thanh toán :  "
		+ order.getMethod() 
		+ "\n"
				+ "Sô điện thoại người đặt hàng : "
		+ order.getPhone()
		+ "\n"
		+ "Đơn hàng có giá trị :"
				+ order.getPrice() 
				+ "\n" 
				+ "Loại tiền tệ : " 
				+ order.getCurrency() 
				+ "\n"
				+ "Intent : "
				+ order.getIntent() 
				+ "\n" 
				+ "Description : " 
				+ order.getStatus()
				+ "\n" 
				+ "Ngày tạo đơn : "
				+ order.getCreateDate() 
				+ "\n" 
				+ "Địa chỉ nhận hàng : " 
				+ order.getAddress() 
				+ "\n" 
		+ "\n" 
		+ "================================");

		msg.setSubject("Đơn hàng số : " + subject);
		javaMailSender.send(msg);
		return "user/result";
	}

	
}