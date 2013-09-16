angular.module("todoApp").controller("TasksController", ["$scope", "$http", "Task", function($scope, $http, Task) {
  $scope.tasks = Task.query();

  $scope.create = function() {
    var new_task = Task.save({}, {task: $scope.newTask}, function(data) {
      $scope.tasks.push(new_task);
    }, function(error_data) {
      alert("An error occurred.")
    });
  };

  $scope.update = function(task) {
    Task.update({id: task.id}, {task: task});
  };
}]);