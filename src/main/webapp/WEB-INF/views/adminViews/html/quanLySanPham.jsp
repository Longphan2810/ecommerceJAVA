<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modernize</title>
<link rel="shortcut icon" type="image/png"
	href="/assets/images/logos/favicon.png" />
<link rel="stylesheet" href="/assets/css/styles.min.css" />
</head>

<body>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<!-- Sidebar Start -->
		<%@ include file="./sidebar/SidebarAdmin.jsp"%>
		<!--  Sidebar End -->
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
					<!--  Header Start -->
			<%@ include file="./sidebar/header.jsp" %>
			<!--  Header End -->

			<!-- body  -->
			<div class="container-fluid">

				<div class="shadow-lg border" style="height: 800px">

					<div class="container m-3">
						<h3>Quản lý Sản phẩm</h3>

						<form:form action="/admin/product-test" method="post" enctype="multipart/form-data" modelAttribute="product">
							<div class="row">
								<input type="hidden" name ="idProductDB" value="${productDB.idProduct}">
								<!-- left -->
								<div class="col-5">

									<img src="/imageProduct/${productDB.nameImage!=null?productDB.nameImage:'noimg.jpg'}"
										class="img-thumbnail border mx-auto" id="previewImage" alt="."
										style="height: 260px; width: 400px">
									<div class="input-group my-3 ">
										<label class="input-group-text" for="inputGroupFile01">Upload
											Image</label> <input type="file" required="required" name="imageFile"  class="form-control"
											id="fileInput">
									</div>

								</div>
								<!-- Right -->
								<div class="col-6">

									<div class="mb-3">
										<label for="exampleFormControlInput1" class="form-label">
											Tên sản phẩm</label> <input type="text" required="required" name="name" value="${productDB.name}" class="form-control"
											id="exampleFormControlInput1" placeholder="Tên sản phẩm">
									</div>

									<div class="row">
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Giá </label> <input type="number" min="0" required="required" name="price" value="${productDB.price}"  class="form-control" placeholder="Giá"
												aria-label="First name">
										</div>

										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Giảm giá</label> <input type="number" min="0" required="required" name="disscount" value="${productDB.disscount}" class="form-control"
												placeholder="%" aria-label="Last name">
										</div>

										<div class="col-12">
										<label for="exampleFormControlInput1" class="form-label">
												So Luong theo size</label>
										
										<div class="col-12 row"> 
												
										<!-- So Luong theo size -->
										
										
										<div class="form-floating mb-3 col-3">
											<input type="number" min="0" name="sizeS" value="${productSizeS.quality}"  class="form-control" id="floatingInput"
												placeholder="S"> <label
												for="floatingInput" > <span class="mx-4"> S </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number" min="0" name="sizeM" value="${productSizeM.quality}" class="form-control"  id="floatingInput"
												placeholder="M"> <label
												for="floatingInput"> <span class="mx-4"> M </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number"  min="0"  name="sizeL" value="${productSizeL.quality}" class="form-control" id="floatingInput"
												placeholder="L"> <label
												for="floatingInput"> <span class="mx-4"> L </span></label>
										</div>
										<div class="form-floating mb-3 col-3">
											<input type="number" min="0" name="sizeXL" value="${productSizeXL.quality}" class="form-control" id="floatingInput"
												placeholder="S"> <label
												for="floatingInput"><span class="mx-4"> XL </span> </label>
										</div>
										
										
										
										<!-- So Luong theo size -->
										
										</div>
										
										</div>

									</div>

									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Loại mặt hàng</label> <select name="idCategory" class="form-select"
											aria-label="Default select example">
											
											<c:forEach var="cate" items="${ListCate}">
												<option  value="${cate.idCategory}"  ${productDB.category.idCategory==cate.idCategory?'selected="selected"':''} >${cate.name}</option>
											
											</c:forEach>
											
											
										
											
										</select>

									</div>
									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Trạng thái</label>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" ${productDB.status==true?'checked':''} type="radio" required="required" name="status"
												 id="inlineRadio1" value="true">
											<label class="form-check-label" for="inlineRadio1">Đang
												mở bán</label>
										</div>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" ${productDB.status==false?'checked':''} type="radio" name="status"
												 id="inlineRadio2" value="false">
											<label class="form-check-label" for="inlineRadio2">Ngừng
												Kinh Doanh</label>
										</div>

									</div>





								</div>
								<!-- bottom -->
								<div class="col-11">

									<div class="mb-3">
										<label for="exampleFormControlTextarea1" class="form-label">
										Mô tả 
										</label>
										<textarea class="form-control"
											id="exampleFormControlTextarea1" name="description" rows="10">${productDB.description}</textarea>
									</div>
								</div>

								<div class="col-11 text-center">
									<button type="submit" formaction="/admin/product/add" class="btn btn-outline-primary mx-2">Thêm</button>
									<button type="submit" formaction="/admin/product/SaveOrUpdate" class="btn btn-outline-primary mx-2">Cập
										Nhật</button>
									<a  href="/admin/product/delete/${productDB.idProduct==null?'-1':productDB.idProduct}"  class="btn btn-outline-primary mx-2">Xoá</a>
									
									<a  href="/admin/product/refresh" class="btn btn-outline-primary mx-2">Làm
										Mới</a>

								</div>

							</div>
						</form:form>



					</div>





				</div>


			</div>
		</div>
	</div>
	
	<!--  thong bao -->

	<div class="toast-container  position-fixed bottom-0 end-0 p-3">
		<div id="liveToast" class="toast ${message!=null?'show':''}"
			role="alert" aria-live="assertive" aria-atomic="true">
			<div class="toast-header">
				<strong class="me-auto">Thông báo</strong>

				<button type="button" class="btn-close" data-bs-dismiss="toast"
					aria-label="Close"></button>
			</div>
			<div class="toast-body">${message}</div>
		</div>
	</div>
	
	
	
	
<script type="text/javascript">
// Lắng nghe sự kiện khi người dùng chọn tệp tin
document.getElementById('fileInput').addEventListener('change', function(event) {
    var file = event.target.files[0];
    var reader = new FileReader();
    
    // Đọc nội dung của tệp tin được chọn
    reader.onload = function(event) {
        var previewImage = document.getElementById('previewImage');
        
        // Cập nhật thuộc tính src của thẻ img để hiển thị hình ảnh đã chọn
        previewImage.src = event.target.result;
    };
    
    reader.readAsDataURL(file);
});



</script>
	
	<script src="/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/sidebarmenu.js"></script>
	<script src="/assets/js/app.min.js"></script>
	<script src="/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="/assets/js/dashboard.js"></script>
</body>

</html>