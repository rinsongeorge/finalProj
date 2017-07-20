<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>FarmToHome Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="resources/static/css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="resources/static/css/sb-admin.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="resources/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<link href = "resources/static/css/jquery-ui.css" rel = "stylesheet">
</head>
<body>
	<div class="logo-admin"><img src="resources/static/images/logo.png" alt="" style=""></div>
    <div id="wrapper">
        <!-- Navigation -->
        
		<jsp:include page="/WEB-INF/views/jsp/adminNavBar.jsp" />

        <div id="page-wrapper">

            <div class="container-fluid">  
			
				<div class="row product-update-div">
                    <div class="col-lg-12">
						<div class="product-master-div">
							<form id="product" action="/FarmToHome/" method="post" >
								<h3>Update Product</h3>
								<fieldset> 
								 <label for="productName">Product name :</label>
								 <input placeholder="Product name" name="productName" id="productName" type="text" tabindex="1" required autofocus>
								</fieldset>
								<fieldset> 
								  <button id="getProduct" type="submit">Get</button>
								  <button type="reset">Reset</button>
								</fieldset>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						  </form>
						</div>
                    </div>
                </div>

                <div class="row product-update-disp-div hidden">
                    <div class="col-lg-12">
						<div class="product-master-div">
							<form id="product" action="/FarmToHome/updateProductDts" name="product" method="post">
								<h3>Update Product</h3>						
								  <h3 id="productName"></h3>	  
								<input id="productID" name="productID" type="hidden">
								<fieldset>
								  <label>Quantity type :</label>
								  <input placeholder="Quantity type" id="productUnitWeight" name="productUnitWeight" type="text" tabindex="2" required>
								</fieldset>

								<fieldset>
								<label>Product Category :</label>
									<select name="categoryID" required>
										<option selected>Choose Category</option>
										<c:forEach var="category" items="${categories}">
											<option value="${category.categoryID}">${category.categoryName}</option>
										</c:forEach>
									</select>
								</fieldset>
								
								<fieldset>
								  <label>Unit Price :</label>
								  <input placeholder="Unit Price" id="productUnitPrice" name="productUnitPrice" type="text" tabindex="3" required>
								</fieldset>
								<fieldset>
								  <label>Product Description :</label>
								  <input placeholder="Product Description" id="productDescription" name="productDescription" type="text" tabindex="4" required>
								</fieldset>
								
								<fieldset>
								  <button type="submit">Update</button>
								  <button type="reset">Reset</button>
								</fieldset>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						  </form>
						</div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="resources/static/js/jquery.min.js"></script>
	<script src = "resources/static/js/jquery-ui.js"></script>
	<script src="resources/static/js/common.js"></script>
	<script>
	  $( function() {
		var availableTags = ${names};
		$( "#productName").autocomplete({
		  source: availableTags
		});
	  } );
  </script>

	<jsp:include page="/WEB-INF/views/jsp/logout.jsp" />
</body>
</html>
