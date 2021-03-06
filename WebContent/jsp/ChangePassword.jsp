<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Change Password Form</title>
	<%@ include file="../resources/NoCacheStore.jsp"%>
	<%@ include file="../resources/js/jslibraries.jsp"%>
	<%@ include file="../resources/css/csslibraries.jsp"%>
	<%@ include file="NavigationBar.jsp" %>
	<script type="text/javascript" src="../js/changePassword.js"></script>
</head>
<body ng-app="passwordApp" ng-controller="passwordController">
	<% 
		if (session.getAttribute("userId") == null) {
			request.setAttribute("error", "Please Login to see the content!");
			RequestDispatcher rd = request.getRequestDispatcher("Index.jsp");
			rd.forward(request, response);
		} else {
			String todoId = request.getParameter("todoId");
	%>
			<div class="container">
				<div class="col-md-6" style="margin: 20px 40px 0px 364px;">
					
					<form name="changePasswordForm" style="margin: 60px 0px 0px 0px;">
						<div class="form-group-row">
							<label for="oldPassword" class="col-md-4">Old Password: </label>
							<input type="password" class="form-control col-md-8" name="oldPassword" ng-model="oldPassword" required/>
						</div>
						<div>
							<label for="newPassword" class="col-md-4">New Password: </label>
							<input type="password" class="form-control col-md-8" name="newPassword" ng-model="newPassword" required/>
						</div>
						<div>
							<label for="confirmPassword" class="col-md-4">Confirm Password: </label>
							<input type="password" class="form-control col-md-8" name="confirmPassword" ng-model="confirmPassword" required/>
							<span ng-if="changePasswordForm.newPassword.$dirty && changePasswordForm.confirmPassword.$dirty 
								&& newPassword != confirmPassword" style="color:red; font-size:13px">New and Confirm passwords are not same!</span>
						</div>
						<div class="form-group row col-md-4" style="margin: 35px 0px 0px 109px;">
							<input type="button" class="btn btn-success" value="Submit" ng-click="changePassword()" 
							ng-disabled="changePasswordForm.$invalid || newPassword != confirmPassword"/>
						</div>
					</form>
				</div>
			</div>
			<div ng-bind="msg" ng-style="{'color': isError == '1' ? '#00aa00' : 'red', 'font-size':'20px', 'margin' : '20px 0px 0px 523px'}"></div>
	<%	} %>
</body>
</html>