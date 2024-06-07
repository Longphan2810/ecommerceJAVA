<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
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


</head>
<body>

	<%@ include file="./component/navbar.jsp" %>

	  <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
           
           
           
           
           
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    
                    <c:set var="totalPrice" value="0"></c:set>
                    <c:forEach var="item" items="${mapShopCart}">
                    	
						
                    	
                       <tr>
                       
                            <td class="align-middle"><img src="/imageProduct/${item.key.nameImage}" alt="" style="width: 50px;">
                            ${item.key.name}  Size ${item.key.size} <br> ( còn : ${item.key.quality} SP)                     	
                            </td>
                            <td class="align-middle">${item.key.price} VND</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                  <form action="/shopCart/Update">
                                    <input type="number" name="quality" onblur="this.form.submit()" class="form-control form-control-sm  text-center" value="${item.value}">
                                    <input type="hidden" name="idProductDetailInHashMap" value="${item.key.idProductDetail}">
                                   </form>
                                </div>
                            </td>
                            <td class="align-middle">
                            
                             <fmt:formatNumber value="${item.value*item.key.price}" type="currency" ></fmt:formatNumber> 
                            </td>
                            <c:set var="totalPrice" value="${totalPrice+item.value*item.key.price}" ></c:set>
                           
                            <td class="align-middle">
                              <form action="/shopCart/remove/${item.key.idProductDetail}" method="get">
                            <button type="submit" class="btn btn-sm btn-danger"><i class="fa fa-times"></i></button>
                           	 </form>
                            </td>
                       		 
                        </tr>
                   			
                    </c:forEach>
                     
                    
                        
                      
                    </tbody>
                </table>
            </div>
            
            
            
            
            
            <div class="col-lg-4">
              
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Subtotal</h6>
                            <h6 class="font-weight-medium">
                            <fmt:formatNumber value="${totalPrice}" type="currency" ></fmt:formatNumber> 
                            
                            </h6>
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
                        <form action="/checkout" method="get">
                        <button type="submit" class="btn btn-block btn-primary my-3 py-3">Proceed To Checkout</button>
                        </form>
                    </div>
                </div>
            </div>
            
            
            
            
        </div>
    </div>
    <!-- Cart End -->
	



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
	


	<!-- Footer Start -->
	<%@ include file="./component/footer.jsp" %>
	
	<!-- Footer End -->


</body>
</html>