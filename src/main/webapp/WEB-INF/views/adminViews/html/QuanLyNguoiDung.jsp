<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Modernize </title>
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

				<div class="shadow-lg border" >

					<div class="container m-3">
						<h3>Quản lý Người Dùng</h3>

						<form action="">
							<div class="row">
								<input type="hidden" name="IdUserDB" value="${userDB.idUser}" >
							
								<!-- Right -->
								<div class="col-11">

									<div class="mb-3" ${userDB.name}>
										<label for="exampleFormControlInput1" class="form-label">
											Tên Người Dùng</label> <input type="text" value="${userDB.name}" class="form-control"
											id="exampleFormControlInput1" readonly="readonly" placeholder="Tên người dùng">
									</div>

									<div class="row">
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Email </label> <input type="email" value="${userDB.email}" readonly="readonly" class="form-control" placeholder=""
												aria-label="First name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Number phone</label> <input type="text" value="${userDB.phone}" readonly="readonly" class="form-control"
												placeholder="" aria-label="Last name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Địa chỉ</label> <input type="text" value="${userDB.location}" readonly="readonly" class="form-control"
												placeholder="" aria-label="Last name">
										</div>
										<div class="col-6">
											<label for="exampleFormControlInput1" class="form-label">
												Ngày Sinh</label> <input type="text" value="${userDB.birhday}" readonly="readonly" class="form-control"
												placeholder="%" aria-label="Last name">
										</div>
										
									</div>

									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Trạng Thái</label> <select name="statusUser" class="form-select"
											aria-label="Default select example">
											<option value="Active" ${userDB.status=='Active'?'selected':'' }>Active</option>
											<option  value="Ban"   ${userDB.status=='Ban'?'selected':'' }>Ban</option>
											<option value="Waiting"${userDB.status=='Waiting'?'selected':'' }>Waiting</option>
										</select>

									</div>
									<div class="mb-3 mt-3">
										<label for="exampleFormControlInput1" class="form-label">
											Quyền Hạn</label>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" type="radio"
												name="role" id="inlineRadio1"  ${userDB.role==true?'checked':'' } value="true">
											<label class="form-check-label" for="inlineRadio1">Admin</label>
										</div>
										<div class="form-check mx-3 form-check-inline">
											<input class="form-check-input" type="radio"
												name="role" id="inlineRadio2"  ${userDB.role==false?'checked':'' } value="false" >
											<label class="form-check-label" for="inlineRadio2">User</label>
										</div>

									</div>





								</div>
							

						<div class="col-11 text-center">
					
						<button type="submit" formaction="/admin/user/update" formmethod="post" class="btn btn-outline-primary mx-2">Cập Nhật</button>
						<button type="submit" formaction="/admin/user" formmethod="post" class="btn btn-outline-primary mx-2">Làm Mới</button>
						
						</div>

							</div>
						</form>



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
	
	
	<script src="/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/assets/js/sidebarmenu.js"></script>
	<script src="/assets/js/app.min.js"></script>
	<script src="/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script src="/assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="/assets/js/dashboard.js"></script>
</body>

</html>