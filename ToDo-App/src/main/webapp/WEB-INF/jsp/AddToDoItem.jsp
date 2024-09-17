<%@ page language = "java" contentType = "text/html; charset =ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
	<meta charset = "ISO-8859-1">
	<title>Add ToDo Item list</title>
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
				background-image: url('https://img.freepik.com/premium-photo/todo-list-colorful-background_204719-21672.jpg');
			    background-size: cover;
			    background-repeat: no-repeat;
			    background-position: center;
				background-attachment: fixed;
			}
	</style>
</head>
<body>
	<div class = "container"> 
		<h1 class="p-3">Add a ToDo Item</h1>
		<form:form action="/saveToDoItem" method = "post" modelAttribute = "todo">
			<div class = "row"> 
				<div class = "form-group col-md-12"> 
					<label class = "col-md-3" for="title">Title</label>
					<div class = "col-md-6">
						<form:input type = "text" path = "title" id = "title"
						    class = "form-control input-sm" required = "required"/>
					</div>
				</div>
			</div>
			
			<div class = "row">
				<div class = "form-group col-md-12"> 
					<label class = "col-md-3" for="date">Date</label>
					<div class = "col-md-6">
						<form:input type = "date" path = "date" id = "date"
						    class = "form-control input-sm" required = "required"/>
					</div>
				</div>
			</div>
			
			<div class = "row">
				<div class = "form-group col-md-12"> 
					<label class = "col-md-3" for="status">Status</label>
					<div class = "col-md-6">
						<form:input type = "text" path = "status" id = "status"
							class = "form-control input-sm" value = "Incomplete"/>
					</div>
				</div>
			</div>
			
			<div class = "row p-2">
				<div class = "col-md-2">
					<button type = "submit" value = "Register" class="btn btn-success">Save</button>
				</div>
			</div>
			
			</form:form>
		</div>
		
		<script th:inline ="javascript">
			window.onload=function(){
				var msg = "${message}";
				if(msg == "Save Failure"){
					Command: toastr["error"]("Something went wrong with the save.")
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