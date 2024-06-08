<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
	
	
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

	<%@ include file="./component/navbarInfo.jsp"%>


	



	<!-- Page Header Start -->
	<div class="container-fluid  my-3 m-auto row">
		<!-- side menu  -->
		<div class="col-3 ">
		
		<!-- account -->
		<div class="row">
		
		
		
		<div class="ms-5 my-2">
		Tài Khoản của <br>
		<span style="font-weight: bold;">${sessionScope.userCurrent.name }</span>
		</div>
		</div>
		
		
		<div class="list-group">
  <a href="/infoCostumer" class="list-group-item list-group-item-action active" aria-current="true">
 <i class="fa-solid fa-user me-3"></i>Thông tin tài khoản
  </a>
   <a href="/orderCostumer/list" class="list-group-item list-group-item-action">
   <i class="fa-solid fa-file-invoice me-3"></i> Quản lý đơn hàng</a>
 
  <a href="/locationCostumer/list" class="list-group-item list-group-item-action">
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
		<form action="/infoCostumer/update" method="post">
		<input type="hidden" value="${userCurrent.email}"  name="email" class="form-control" id="exampleInputEmail1" >
  <div class="mb-3">
    Họ và tên :
    <input type="text" value="${userCurrent.name}"  name="name" class="form-control" id="exampleInputEmail1" >
    
  </div>
    <div class="mb-3">
    Ngày sinh :
       <fmt:formatDate var="birthdayUserCurrent" value="${userCurrent.birhday}" pattern="yyyy-MM-dd"/>
    <input type="date" value="${birthdayUserCurrent}" required="required"	 name="birhdayYet" class="form-control" id="exampleInputEmail1" >
 
  </div>
   <div class="mb-3">
    Giới Tính :
    <div class="ms-3 form-check form-check-inline">
  <input class="form-check-input"  required="required" ${userCurrent.gender==true&&userCurrent.gender!=null?'checked':''} type="radio" name="gender" id="inlineRadio1" value="true">
  <label class="form-check-label" for="inlineRadio1">Nam</label>
</div>
<div class="form-check form-check-inline">
  <input class="form-check-input" required="required" ${userCurrent.gender==false&&userCurrent.gender!=null?'checked':''} type="radio" name="gender" id="inlineRadio2" value="false">
  <label class="form-check-label" for="inlineRadio2">Nu</label>
</div>

</div>
    
     <div class="mb-3">
    
   Số điện thoại :
    <input type="text" value="${userCurrent.phone}"  name="phone" class="form-control" id="exampleInputEmail1" >
    
</div>

   <div class="mb-3">
    
   Địa chỉ :
    <input type="text" value="${userCurrent.location}"  name="location" class="form-control" id="exampleInputEmail1" >
    
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
								<span> Số điện thoại  <br> ${userCurrent.phone}
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
								<span> Email  <br> ${userCurrent.email}
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
						<button type="submit" formaction="/infoCostumer/password" formmethod="get" class="btn btn-outline-primary">Changes</button>
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