angular.module("todoApp").controller("MainController", ["$scope", "$location", "Session", function($scope, $location, Session) {
  $scope.sign_out = function() {
    Session.delete(function(data) {
      $location.path("/login")
    })
  }
}]);