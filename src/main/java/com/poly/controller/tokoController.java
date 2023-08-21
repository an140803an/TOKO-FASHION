package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.ProductsDetailDAO;
import com.poly.entity.Categories;
import com.poly.entity.Products;

@Controller
public class tokoController {
	@Autowired
	ProductDAO proDao;
	@Autowired
	CategoryDAO cateDAO;
	@Autowired
	ProductsDetailDAO detailDAO;

	@GetMapping("/sanpham/list")
	public String list(Model model) {
		List<Products> list = proDao.findAll();
		model.addAttribute("items", list);
		return "sanpham";
	}

	@RequestMapping("/sanpham/chiTiet/{id}")
	public String detail(Model model, @PathVariable("id") String id) {
		Products product = proDao.findProductById(id);
//		Categories categories = cateDAO.hideSize(id);

		// Xác định categoryType dựa vào logic của bạn	
		//String categoryType = "shirt"; // Ví dụ: "shirt" hoặc "balo" hoặc loại khác

		// Đưa categoryType vào model để sử dụng trong Thymeleaf
		
		//model.addAttribute("item", categories);
		List<String> sizes = detailDAO.findSizesByProductId(id);
        model.addAttribute("sizes", sizes);
		model.addAttribute("item", product);

		return "chiTiet";
	}
//	public List<Categories> getCategories() {
//		return cateDAO.findAll();
//	}
//
//	@RequestMapping("/sanpham/list-by-category/{id}")
//	public String listByCategory(Model model, @PathVariable("id") String id) {
//		Categories list = (Categories) cateDAO.findByCategoryId(id);
//		model.addAttribute("items", list);
//		return "sanpham";
//	}
	
	@RequestMapping("/sanpham/listCate")
	public String listByCategory(Model model, @RequestParam("cid") Optional<String> cid) {
		if (cid.isPresent()) {
			List<Products> list = proDao.findByCategoryId(cid.get());
			model.addAttribute("items", list);
			
		}
		else {
			List<Products> list = proDao.findAll();
			model.addAttribute("items", list);
		}
		return "sanpham";
	}

}
