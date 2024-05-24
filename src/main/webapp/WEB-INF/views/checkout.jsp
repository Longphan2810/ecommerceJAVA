<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Neko Shop</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">


</head>
<body>

	<%@ include file="./component/navbar.jsp" %>

	  <h3 class="ms-5">Thanh Toán</h3>
	  
	  <div class="container-fluid w-75 ">
	    	<!-- Dia chi giao -->
              <div class="card border-secondary w-100">
                    <div class="card-header   border">
                        <h4 class="font-weight-semi-bold m-0">Giao tới </h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                        <div> <h6 class="font-weight-medium">Nguyen van a  (0776946628)</h6></div>
                           
                        <div class="w-50">   
                            <h6 class="font-weight-medium">Cầu Cống Tiềm (Quán bún thu), Đường Trần Đại Nghĩa, Phường Điện Ngọc, Thị Xã Điện Bàn, Quảng Nam</h6>
                        </div>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium"></h6>
                            <h6 class="font-weight-medium">
                            <a  href="#" class="" data-bs-toggle="modal" data-bs-target="#exampleModal">Thay Đổi</a>
                            </h6>
                        </div>
                    </div>
                    
                </div>
                </div>
	  <!-- Cart Start -->
    <div class="container-fluid pt-5">
    
        <div class="row px-xl-5">
      	<h4>Sản phẩm</h4>
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                           
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<!-- san pham -->
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        
                                    </div>
                                    <input type="text" readonly="readonly" class="form-control form-control-sm  text-center" value="1">
                                    <div class="input-group-btn">
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                        
                        </tr>
                        
                        <!-- san pham -->
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        
                                    </div>
                                    <input type="text" readonly="readonly" class="form-control form-control-sm  text-center" value="1">
                                    <div class="input-group-btn">
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                        
                        </tr>
                        
                        <!-- san pham -->
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        
                                    </div>
                                    <input type="text" readonly="readonly" class="form-control form-control-sm  text-center" value="1">
                                    <div class="input-group-btn">
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                        
                        </tr>
                        
                        <!-- san pham -->
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        
                                    </div>
                                    <input type="text" readonly="readonly" class="form-control form-control-sm  text-center" value="1">
                                    <div class="input-group-btn">
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                        
                        </tr>
                        
                        <!-- san pham -->
                        <tr>
                            <td class="align-middle"><img src="img/product-1.jpg" alt="" style="width: 50px;"> Colorful Stylish Shirt</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        
                                    </div>
                                    <input type="text" readonly="readonly" class="form-control form-control-sm  text-center" value="1">
                                    <div class="input-group-btn">
                                       
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                        
                        </tr>
                        
                        
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
              
              
            
              
              
              	<!-- tong tien -->
                <div class="card border-secondary mb-5">
                    <div class="card-header  border-0">
                        <h4 class="font-weight-semi-bold m-0">Thanh toán </h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">$150</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">$10</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Total</h5>
                            <h5 class="font-weight-bold">$160</h5>
                        </div>
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold"></h5>
                            <button class="btn btn-block btn-primary my-3 py-3">Đặt hàng</button>
                        </div>
                        
                    </div>
                </div>
                
                
                
                
            </div>
        </div>
    </div>
    <!-- Cart End -->
	

<!-- Modal đổi địa chỉ giao -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Địa chỉ của tôi</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body ">
        
        
        <form action="">
        <!-- địa chỉ  -->
        <div class="form-check border-bottom">
  		<input class="form-check-input" checked type="radio" name="flexRadioDefault" id="flexRadioDefault1">
 		 <label class="form-check-label" for="flexRadioDefault1">
   		 	Nguyen van a  (386586942)<br>
   		 	<div>
   		 	Cầu Cống Tiềm (Quán bún thu), Đường Trần Đại Nghĩa
			Phường Điện Ngọc, Thị Xã Điện Bàn, Quảng Nam
			</div>
  		</label>
		</div>
		 <!-- địa chỉ  -->
        <div class="form-check border-bottom">
  		<input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
 		 <label class="form-check-label" for="flexRadioDefault1">
   		 	Nguyen van a  (386586942)<br>
   		 	<div>
   		 	Cầu Cống Tiềm (Quán bún thu), Đường Trần Đại Nghĩa
			Phường Điện Ngọc, Thị Xã Điện Bàn, Quảng Nam
			</div>
  		</label>
		</div>
        
        
        
        
        </form>
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
  


	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp" %>
	
	<!-- Footer End -->


</body>
</html>