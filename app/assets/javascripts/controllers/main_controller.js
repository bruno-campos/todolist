angular.module("todoApp").controller("MainController", ["$scope", "$location", "Session", function($scope, $location, Session) {
  $scope.current_user = null;

  $scope.sign_out = function() {
    Session.delete(function(data) {
      $location.path("/login");
    })
  };

  $scope.setUserData = function(user) {
    $scope.current_user = user;
  };

  $scope.init = function() {
    Session.query(function(data) {
      $scope.setUserData(data.user);
      $location.path("/tasks");
    }, function(error_data) {
      $location.path("/login")  ;
    });
  };

  $scope.init();
}]);