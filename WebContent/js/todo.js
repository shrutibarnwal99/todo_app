var myApp = angular.module('todoApp', []);

myApp.controller('todoController', function ($scope, $http) {

	$scope.obj = {title: '', body: '', dueDate: '', todoId: ''};
	$scope.operation = '';
	$scope.msg = '';
	$scope.isError = '';
	angular.element(document).ready(function() {
		var todoId = document.getElementById('todoId').value;
		if(todoId != -1) {
			$http.get('/todo_app/ViewToDoController?todoId=' + todoId).then(function(response) {
				var res = response.data;
				console.log(res);
				if(res) {
					$scope.obj.title = res.title;
					$scope.obj.body = res.body;
					$scope.obj.dueDate = new Date(res.dueDate);
				}
			});
		}
		
	});

	$scope.saveTodo = function() {
		var todoId = document.getElementById('todoId').value;
		$scope.obj.todoId = todoId;
		$scope.obj.dueDate = $scope.obj.dueDate.toLocaleDateString();
		if (todoId != -1)
			$scope.operation = 'Updated';
		else
			$scope.operation = 'Created';

		$http.post('/todo_app/CreateUpdateToDoController', JSON.stringify($scope.obj)).then(function(response) {
			$scope.obj.title = '';
			$scope.obj.body = '';
			$scope.obj.dueDate = '';	
			console.log(response.data);
			if (response.data == -1) {
				$scope.isError = 1;
				$scope.msg = $scope.operation + " failed!";
			} else {
				$scope.isError = 0;
				$scope.msg = $scope.operation + ' Successfully!';
			}
		});
	}
});