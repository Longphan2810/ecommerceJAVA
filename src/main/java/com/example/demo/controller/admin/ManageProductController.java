package com.example.demo.controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.support.PageableUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.DTO.ProductDTO;
import com.example.demo.domain.Category;
import com.example.demo.domain.Product;
import com.example.demo.domain.ProductDetail;
import com.example.demo.service.ParamService;
import com.example.demo.service.impl.CategoryServiceImpl;
import com.example.demo.service.impl.ProductDetailServiceImpl;
import com.example.demo.service.impl.ProductServiceImpl;

import jakarta.servlet.ServletContext;

@Controller
public class ManageProductController {

	@Autowired
	CategoryServiceImpl categoryServiceImpl;

	@Autowired
	ProductServiceImpl productServiceImpl;

	@Autowired
	ProductDetailServiceImpl productDetailServiceImpl;

	@Autowired
	ServletContext application;

	@Autowired
	ParamService paramService;

	@ModelAttribute("ListCate")
	public List<Category> getListCate() {

		return categoryServiceImpl.findAll();
		}

	@ModelAttribute("listProduct")
	public List<Product> getListProduct() {

		return productServiceImpl.findAll();
	}

	@GetMapping("/admin/product")
	public String getAdminSanPham(Model model) {

		ProductDTO product = new ProductDTO();
		model.addAttribute("product", product);
		return "adminViews/html/QuanLySanPham";

	}

	@RequestMapping("/admin/list-product")
	public String getAdmindsSanPham(Model model,@RequestParam("p") Optional<Integer> p) {

		String keywords = paramService.getString("keywords", "");
		
		System.out.println(keywords);
		
		if(!keywords.trim().equalsIgnoreCase("")) {
			
			return "forward:/admin/list-product/findByName";
		}
		
		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		
		Page<Product> page = productServiceImpl.findAll(pageable);
		
		System.out.println(page.getTotalElements());
		
		model.addAttribute("pageProduct", page);
		model.addAttribute("keywords", keywords);
		
		return "adminViews/html/DanhSachSanPham";

	}
	
	@GetMapping("/admin/list-product/findByName")
	public String getAdmindsSanPhamFindByName(Model model,@RequestParam("p") Optional<Integer> p) {

		Pageable pageable = PageRequest.of(p.orElse(0), 10);
		
		String keywords = paramService.getString("keywords", "");
		
		Page<Product> page = productServiceImpl.findAllByNameLike("%"+keywords+"%", pageable);
		
		System.out.println(page.getTotalElements());
		
		model.addAttribute("pageProduct", page);
		model.addAttribute("keywords", keywords);
		
		
		return "adminViews/html/DanhSachSanPham";

	}

	@PostMapping("/admin/product/add")
	public String getAddProduct(@ModelAttribute("product") ProductDTO product, Model model) {

		// get size and quality
		int sizeS = paramService.getInt("sizeS", 0);
		int sizeM = paramService.getInt("sizeM", 0);
		int sizeL = paramService.getInt("sizeL", 0);
		int sizeXL = paramService.getInt("sizeXL", 0);

		System.out.println("Size s :" + sizeS);

		System.out.println("Size m :" + sizeM);

		System.out.println("Size l :" + sizeL);

		System.out.println("Size xl :" + sizeXL);

		// get and check idProduct

		int idProduct = paramService.getInt("idProduct", -1);

		if (idProduct > 0) {

			model.addAttribute("message", "Vui lòng làm mới trước khi thêm !");

			return "adminViews/html/QuanLySanPham";

		}

		// handles image and save image
		File containerImageProduct = new File(application.getRealPath("/imageProduct"));
		if (!containerImageProduct.exists()) {
			System.out.println("da tao");
			containerImageProduct.mkdirs();
		}
		String nameImage = product.getImageFile().getOriginalFilename();
		product.setNameImage(nameImage);
		try {
			product.getImageFile().transferTo(Paths.get(containerImageProduct.getAbsolutePath() + "/" + nameImage));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// copy data form productDTO to productDB
		Product productDB = new Product();
		BeanUtils.copyProperties(product, productDB);
		// get and set category to productDB
		Category categoryForProduct = categoryServiceImpl.getById(product.getIdCategory());
		productDB.setCategory(categoryForProduct);

		// create product detail ( set size and quality for size)

		ProductDetail productDetailSizeS = new ProductDetail();
		productDetailSizeS.setProduct(productDB);
		productDetailSizeS.setQuality(sizeS);
		System.out.println(productDetailSizeS.getQuality());
		productDetailSizeS.setSize("S");

		ProductDetail productDetailSizeM = new ProductDetail();
		productDetailSizeM.setProduct(productDB);
		productDetailSizeM.setQuality(sizeM);
		System.out.println(productDetailSizeM.getQuality());
		productDetailSizeM.setSize("M");

		ProductDetail productDetailSizeL = new ProductDetail();
		productDetailSizeL.setProduct(productDB);
		productDetailSizeL.setQuality(sizeL);
		System.out.println(productDetailSizeL.getQuality());
		productDetailSizeL.setSize("L");

		ProductDetail productDetailSizeXL = new ProductDetail();
		productDetailSizeXL.setProduct(productDB);
		productDetailSizeXL.setQuality(sizeXL);
		System.out.println(productDetailSizeXL.getQuality());
		productDetailSizeXL.setSize("XL");

		// create product and product detail in database

		productServiceImpl.save(productDB);
//		
		productDetailServiceImpl.save(productDetailSizeS);
		productDetailServiceImpl.save(productDetailSizeM);
		productDetailServiceImpl.save(productDetailSizeL);
		productDetailServiceImpl.save(productDetailSizeXL);

		model.addAttribute("message", "Đã lưu thành công !");

		return "adminViews/html/QuanLySanPham";

	}

	// waiting for function edit

	@PostMapping("/admin/product/SaveOrUpdate")
	public String getSaveOrUpdate(@ModelAttribute("product") ProductDTO product, Model model) {

		// get size and quality
		int sizeS = paramService.getInt("sizeS", 0);
		int sizeM = paramService.getInt("sizeM", 0);
		int sizeL = paramService.getInt("sizeL", 0);
		int sizeXL = paramService.getInt("sizeXL", 0);

//		System.out.println("Size s :" + sizeS);
//		
//		System.out.println("Size m :" + sizeM);
//		
//		System.out.println("Size l :" + sizeL);
//		
//		System.out.println("Size xl :" + sizeXL);

		// get and check idProduct
		int idProduct = paramService.getInt("idProductDB", -1);
		if (productServiceImpl.existsById(idProduct)) {
			product.setIdProduct(idProduct);

			System.out.println(" tim thay product");
		}

		// handles image and save image
		File containerImageProduct = new File(application.getRealPath("/imageProduct"));
		if (!containerImageProduct.exists()) {
			System.out.println("da tao");
			containerImageProduct.mkdirs();
		}
		String nameImage = product.getImageFile().getOriginalFilename();
		product.setNameImage(nameImage);
		try {
			product.getImageFile().transferTo(Paths.get(containerImageProduct.getAbsolutePath() + "/" + nameImage));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// copy data form productDTO to productDB
		Product productDB = new Product();
		BeanUtils.copyProperties(product, productDB);

		System.out.println(product.toString());
		System.out.println(productDB.toString());

		// get and set category to productDB
		Category categoryForProduct = categoryServiceImpl.getById(product.getIdCategory());
		productDB.setCategory(categoryForProduct);

		// create product detail ( set size and quality for size)

		ProductDetail productDetailSizeS = productDetailServiceImpl.findBySizeAndIdProduct("S", idProduct);
		
		if(productDetailSizeS==null) {
			productDetailSizeS = new ProductDetail();
		}
	
		productDetailSizeS.setProduct(productDB);
		productDetailSizeS.setQuality(sizeS);
		System.out.println(productDetailSizeS.getQuality());
		productDetailSizeS.setSize("S");

		ProductDetail productDetailSizeM = productDetailServiceImpl.findBySizeAndIdProduct("M", idProduct);
		
		if(productDetailSizeM==null) {
			productDetailSizeM = new ProductDetail();
		}
		productDetailSizeM.setProduct(productDB);
		productDetailSizeM.setQuality(sizeM);
		System.out.println(productDetailSizeM.getQuality());
		productDetailSizeM.setSize("M");

		ProductDetail productDetailSizeL = productDetailServiceImpl.findBySizeAndIdProduct("L", idProduct);
		
		if(productDetailSizeL==null) {
			productDetailSizeL = new ProductDetail();
		}
		productDetailSizeL.setProduct(productDB);
		productDetailSizeL.setQuality(sizeL);
		System.out.println(productDetailSizeL.getQuality());
		productDetailSizeL.setSize("L");

		ProductDetail productDetailSizeXL = productDetailServiceImpl.findBySizeAndIdProduct("XL", idProduct);
		
		if(productDetailSizeXL==null) {
			productDetailSizeXL = new ProductDetail();
		}
		productDetailSizeXL.setProduct(productDB);
		productDetailSizeXL.setQuality(sizeXL);
		System.out.println(productDetailSizeXL.getQuality());
		productDetailSizeXL.setSize("XL");

		// create product and product detail in database

		productServiceImpl.save(productDB);

		productDetailServiceImpl.save(productDetailSizeS);
		productDetailServiceImpl.save(productDetailSizeM);
		productDetailServiceImpl.save(productDetailSizeL);
		productDetailServiceImpl.save(productDetailSizeXL);

		model.addAttribute("message", "Đã lưu thành công !");

		return "adminViews/html/QuanLySanPham";

	}

	@GetMapping("/admin/product/edit/{id}")
	public String editProduct(@PathVariable("id") int idProduct, Model model) {

		Product productDB = productServiceImpl.getById(idProduct);
		ProductDetail productSizeS = productDetailServiceImpl.findBySizeAndIdProduct("S", productDB.getIdProduct());
		ProductDetail productSizeM = productDetailServiceImpl.findBySizeAndIdProduct("M", productDB.getIdProduct());
		ProductDetail productSizeL = productDetailServiceImpl.findBySizeAndIdProduct("L", productDB.getIdProduct());
		ProductDetail productSizeXL = productDetailServiceImpl.findBySizeAndIdProduct("XL", productDB.getIdProduct());

		model.addAttribute("productSizeS", productSizeS);
		model.addAttribute("productSizeM", productSizeM);
		model.addAttribute("productSizeL", productSizeL);
		model.addAttribute("productSizeXL", productSizeXL);

		model.addAttribute("productDB", productDB);

		return "adminViews/html/QuanLySanPham";
	}

	
	@GetMapping("/admin/product/delete/{idProduct}")
	public String deleteProduct(@PathVariable("idProduct") int idProduct,Model model) { 
		
	
		if(idProduct==-1) {
			model.addAttribute("message", "Vui lòng chọn chỉnh sửa trong danh sách sản phẩm trước !");
			return "adminViews/html/QuanLySanPham";
		}
		
		if(!productServiceImpl.existsById(idProduct)) {
			model.addAttribute("message", "Không tồn tại sản phẩm cần xoá vui lòng kiểm tra lại !");
			return "adminViews/html/QuanLySanPham";
			
		}
		
		try {
			
			productDetailServiceImpl.DeleteAllByIdProduct(idProduct);
			productServiceImpl.deleteById(idProduct);
			model.addAttribute("message", "Đã xoá thông tin !");
			return "adminViews/html/QuanLySanPham";
		} catch (Exception e) {
			// TODO: handle exception
			model.addAttribute("message", "Không thể xoá hãy thử cập nhật trạng thái !");
			System.out.println(e);
			return "adminViews/html/QuanLySanPham";
		}
		
	
	}
	
	@RequestMapping("/admin/product/refresh")
	public String refreshPage() {

		return "adminViews/html/QuanLySanPham";
	}

	
}
