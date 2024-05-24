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

<script src="https://kit.fontawesome.com/bceea5e627.js" crossorigin="anonymous"></script>

</head>
<body>

		<%@ include file="./component/navbar.jsp" %>






	<!-- Page Header Start -->
	<div class="container-fluid  my-3 m-auto row">
		<!-- side menu  -->
		<div class="col-3 ">
		
		<!-- account -->
		<div class="row">
		
		
		
		<div class="ms-5 my-2">
		Tài Khoản của <br>
		<span style="font-weight: bold;">Nguyen van a </span>
		</div>
		</div>
		
		
		<div class="list-group">
  <a href="/infoCostumer" class="list-group-item list-group-item-action active" aria-current="true">
 <i class="fa-solid fa-user me-3"></i>Thông tin tài khoản
  </a>
   <a href="/orderCostumer" class="list-group-item list-group-item-action">
   <i class="fa-solid fa-file-invoice me-3"></i> Quản lý đơn hàng</a>
 
  <a href="/locationCostumer" class="list-group-item list-group-item-action">
   <i class="fa-solid fa-location-dot me-3"></i> Sổ địa chỉ</a>
  <a  class="list-group-item list-group-item-action">Coming soon . . .</a>
</div>
		
		
		</div>
		<!-- side menu  -->
		<!-- info  -->
		<div class="col-9 shadow-lg  row " style="height: 500px">
		
		<!-- form info -->
		<div class="col-7  h-100 border-end">
		
		
		<div class="my-3  ">
		<span style="font-size: x-large;font-style: inherit;" >Thông tin cá nhân</span>
		</div>
		<form>
  <div class="mb-3">
    Họ và tên :
    <input type="text" class="form-control" id="exampleInputEmail1" >
    
  </div>
    <div class="mb-3">
    Ngày sinh :
    <input type="date" class="form-control" id="exampleInputEmail1" >
    
  </div>
   <div class="mb-3">
    Giới Tính :
    <div class="ms-3 form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
  <label class="form-check-label" for="inlineRadio1">Nam</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
  <label class="form-check-label" for="inlineRadio2">Nu</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
  <label class="form-check-label" for="inlineRadio2">Khac</label>
</div>
</div>
    
     <div class="mb-3">
    
    
  
  Quốc tịch :
    <select class="form-select" aria-label="Default select example">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
</div>
  
  <button type="submit" class="  btn btn-primary">Lưu thay đổi</button>
</form>
		
		
		</div>
		
		<!-- changes pass and email  -->
		<div class="col-5 row ">
		
			<!-- sdt va email -->
		<div >
		  <div  class="mt-3">
		
		<span style="font-size: large;font-style: inherit;" >Số điện thoại và email</span>
		</div>
				<!-- sdt -->
					<div class="row mt-2 py-3 border-bottom">

						<!-- info -->
						<div class="col-10 row">
							<i class="fa-solid fa-phone col-2"></i>
							<div class="col-10">
								<span> Số điện thoại  <br> 09877547765
								</span>
							</div>
						</div>
						<!-- button -->
						<div  class="col-2">
						
						</div>

					</div>

					<!-- email -->

					<div class="row mt-2 py-3 ">

						<!-- info -->
						<div class="col-10 row">
							<i class="fa-solid fa-envelope col-2"></i>
							<div class="col-10">
								<span> Email  <br> nguyenvana@gmail.com
								</span>
							</div>
						</div>
						<!-- button -->
						<div  class="col-2">
						
						</div>

					</div>

				</div>

	
	<!-- Bao mat -->
		<div >
		  <div  class="">
		
		<span style="font-size: large;font-style: inherit;" >Bảo mật</span>
		</div>
				<!-- sdt -->
					<div class="row mt-2 py-3 ">

						<!-- info -->
						<div class="col-10 row">
							<i class="fa-solid fa-lock col-2"></i>
							<div class="col-10">
								<span> Đổi mật khẩu  
								</span>
							</div>
						</div>
						<!-- button -->
						<div  class="col-2">
						<form >
						<button type="submit" formaction="/changePassCostumer" formmethod="get" class="btn btn-outline-primary">Changes</button>
						</form>
						</div>

					</div>

				

				</div>
	
		
		
		
		</div>
		
		
		
		
		
		</div>
		<!-- info  -->
		
		
	</div>
	<!-- Page Header End -->



	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp"%>

	<!-- Footer End -->


</body>
</html>