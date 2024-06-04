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
			<header class="app-header">
				<nav class="navbar navbar-expand-lg navbar-light">
					<ul class="navbar-nav">
						<li class="nav-item d-block d-xl-none"><a
							class="nav-link sidebartoggler nav-icon-hover"
							id="headerCollapse" href="javascript:void(0)"> <i
								class="ti ti-menu-2"></i>
						</a></li>

					</ul>
					<div class="navbar-collapse justify-content-end px-0"
						id="navbarNav">
						<ul
							class="navbar-nav flex-row ms-auto align-items-center justify-content-end">

							<li class="nav-item dropdown"><a
								class="nav-link nav-icon-hover" href="javascript:void(0)"
								id="drop2" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="/assets/images/profile/user-1.jpg" alt=""
									width="35" height="35" class="rounded-circle">
							</a>
								<div
									class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up"
									aria-labelledby="drop2">
									<div class="message-body">
										<a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-user fs-6"></i>
											<p class="mb-0 fs-3">My Profile</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-mail fs-6"></i>
											<p class="mb-0 fs-3">My Account</p>
										</a> <a href="javascript:void(0)"
											class="d-flex align-items-center gap-2 dropdown-item"> <i
											class="ti ti-list-check fs-6"></i>
											<p class="mb-0 fs-3">My Task</p>
										</a> <a href="./authentication-login.html"
											class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
									</div>
								</div></li>
						</ul>
					</div>
				</nav>
			</header>
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
												passport</label> <input type="text" value="${userDB.passport}" readonly="readonly" class="form-control"
												placeholder="%" aria-label="Last name">
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