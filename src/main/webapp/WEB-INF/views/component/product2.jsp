<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border mb-4">
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<img class="img-fluid w-100" src="/imageProduct/${param.image}" style="height: 250px" alt="">
							</div>
							  <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                        <h6 class="text-truncate mb-3">${param.name }</h6>
                        <div class="d-flex justify-content-center">
                        <h6 class="pe-2">
                        <fmt:formatNumber value="${param.price} " type="currency" ></fmt:formatNumber>
                        VND</h6>
                        
                        
              
                        </div>
                    </div>
							<div class="card-footer d-flex justify-content-center bg-light border">
								<form action="/detail">
								<input  type="hidden" name="idProduct"  value="${param.id}">
								<button type="submit" formaction="/detail" formmethod="get" class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</button> 
									</form>
									
							</div>
						</div>
					</div>