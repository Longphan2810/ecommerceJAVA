<!-- Topbar Start -->
	<div class="container-fluid">

		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="/" class="text-decoration-none">
					<h1 class="m-0 display-5 font-weight-semi-bold">Neko Shop</h1>
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form action="/shop/filter" method="get">
					<div class="input-group">
						<input type="text" class="form-control"
							name="keywords"
							placeholder="Search for products">
						<div class="input-group-append">
							<button type="submit" class="btn border"  role="button"> <span
								class=" bg-transparent text-primary h-100">
									<i class="fa fa-search"></i>
							</span>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<!-- shopping cart -->
				 <a href="/shopCart" class="btn border"> <i
					class="fas fa-shopping-cart text-primary"></i> <span class="badge">0</span>
				</a>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<div class="container-fluid ">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">

				<a
					class="btn-lg btn py-3 shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100"
					data-bs-toggle="collapse" role="button" aria-expanded="false"
					aria-controls="collapseExample"> Categories <i
					class="fa fa-angle-down text-dark"></i>
				</a>

				<div class="collapse show" id="collapseExample">
					<div class="card card-body">
						<nav
							class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 "
							id="navbar-vertical">
							<div class="navbar-nav w-100 overflow-hidden"
								style="height: 350px">

								<c:forEach var="cate" items="${listCate}">
                      			   <a href="/shop/${cate.name}" class="nav-item nav-link">${cate.name}</a>
                      			</c:forEach>
							</div>
						</nav>
					</div>
				</div>
			</div>
			<div class="col-lg-9">
				<nav
					class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0"
					style="background-color: white;">
					<a href="" class="text-decoration-none d-block d-lg-none">
						<h1 class="m-0 display-5 font-weight-semi-bold">neko shop</h1>
					</a>
							 <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
					<div class="collapse navbar-collapse justify-content-between p-3"
						id="navbarSupportedContent">
						<div class="navbar-nav mr-auto py-0">
							<a href="/" class="nav-item nav-link active">Home</a> <a
								href="/shop" class="nav-item nav-link">Shop</a> 
							
							
						</div>
						<div class="navbar-nav ml-auto py-0">
							<a href="/login" class="nav-item nav-link">Login</a> <a href="/login"
								class="nav-item nav-link">Register</a>
						</div>
					</div>
				</nav>
				<!-- Page Header Start -->
				<div class="container-fluid  mb-5"
					style="background-color: rgb(210, 213, 215);">
					<div
						class="d-flex flex-column align-items-center justify-content-center"
						style="min-height: 370px">
						<h1 class="font-weight-semi-bold text-uppercase mb-3">Our
							Shop</h1>
						
					</div>
				</div>
				<!-- Page Header End -->



			</div>
		</div>
	</div>
	<!-- Navbar End -->
