<%@ page language = "java" contentType = "text/html; charset =ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
	<meta charset = "ISO-8859-1">
	<title>View ToDo Item List</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	
	<style>
		html, body {
			height: 100%;
		    margin: 0;
		    padding: 0;
		}

		body {
			background-image: url('https://res.cloudinary.com/imagist/image/fetch/q_auto,f_auto,c_scale,w_2624/https%3A%2F%2Ftodoist.com%2Fstatic%2Fproduct-ui%2Fbackgrounds%2Fwave-one-red.png');
		    background-size: cover;
		    background-repeat: no-repeat;
		    background-position: center;
			background-attachment: fixed;
		}

		
		a{
			color : white;
		}
		a:hover{
			color:white;
			text-decoration:none;
		}
	</style>
</head>
<body>
	<div class = "container"> 
		<h1 class="p-3">ToDo Item List</h1>
		<form:form>
			<table class = "table table-bordered">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<th>Status</th>
					<th>Mark Completed</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>
				
				<c:forEach var="todo" items="${list}">
					<tr>
						<td>${todo.id}</td>
						<td>${todo.title}</td>
						<td>${todo.date}</td>
						<td>${todo.status}</td>
						<td><button type="button" class="btn btn-success">
							<a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
						</button></td>
						<td><button type="button" class="btn btn-primary">
						    <a href="/editToDoItem/${todo.id}">Edit</a>
						</button></td>
						<td><button type="button" class="btn btn-danger">
						     <a href="/deleteToDoItem/${todo.id}">Delete</a>
						</button></td>
				 </c:forEach>
			   </table>
			</form:form>
			
			<button type="button" class="btn btn-primary btn-block">
			       	<a href="/addToDoItem">Add New ToDo Item</a>
			</button>
	</div>
	<script th:inline ="javascript">
		window.onload=function(){
			var msg = "${message}";
			if(msg == "Save Success"){
				Command: toastr["success"]("Item added Successfully!!!!!")
			}
			else if(msg == "Delete Success"){
				Command: toastr["success"]("Item Deleteed Successfully!!!!!")
			}
			else if(msg == "Delete Failure"){
				Command: toastr["error"]("Some error occured , couldn't delete item......")
			}
			if(msg == "Edit Success"){
				Command: toastr["success"]("Item updated Successfully!!!!!")
			}
			toastr.options = {
					
			   "closeButton": true,
			   "debug": false,
			   "newestOnTop": false,
			   "progressBar": true,
			   "positionClass": "toast-top-right",
			   "preventDuplicates": false,
			   "showDuration": "300",
			   "hideDuration": "1000",
			   "timeOut": "5000",
			   "extendedTimeOut": "1000",
			   "showEasing": "swing",
			   "hideEasing": "linear",
			   "showMethod": "fadeIn",
			   "hideMethod": "fadeOut"
		  }

		}
		
	</script>
	
	
</body>
</html>
	