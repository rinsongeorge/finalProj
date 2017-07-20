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
</head>
<body>
	<div class="logo-admin"><img src="resources/static/images/logo.png" alt="" style=""></div>
    <div id="wrapper">
        <!-- Navigation -->
       <jsp:include page="/WEB-INF/views/jsp/adminNavBar.jsp" />
        <div id="page-wrapper">

            <div class="container-fluid">           
                <div class="row">
                    <div class="col-lg-12">
						<div class="product-master-div">
							<form id="product" action="/FarmToHome/addCategory" name="category" method="post">
								<h3>Category Master</h3>
								<fieldset>
								  <input placeholder="Category Name" name="categoryName" type="text" tabindex="1" required autofocus>
								</fieldset>
								<fieldset>
								  <input placeholder="Category Description" name="description" type="text" tabindex="2" required>
								</fieldset>

								<fieldset>	  
								  <button type="submit">Submit</button>
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
	<jsp:include page="/WEB-INF/views/jsp/logout.jsp" />
</body>
</html>
