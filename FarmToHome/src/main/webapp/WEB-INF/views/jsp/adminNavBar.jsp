<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header"> 
                <a class="navbar-brand" href="javascript:void(0)">Farm To Home</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="javascript:void(0)"><i></i> John Smith</a>    
                </li>
				<li>	
					<a href="javascript:void(0)"><i></i> Logout</a>
				</li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">   
                    <li>	
                        <a href="/FarmToHome/Admin"><i></i>Add Product</a>
                    </li>
					 <li>
                        <a href="/FarmToHome/AdminUpdateProduct"><i></i>Update Product</a>
                    </li> 
                    <li>
                        <a href="/FarmToHome/AdminCategory"><i></i> Category Master</a>
                    </li>   
                    <li>
                        <a href="/FarmToHome/AdminReports"><i></i> Report</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
