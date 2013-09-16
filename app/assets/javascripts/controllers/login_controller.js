angular.module("todoApp").controller("LoginController", ["$scope", "$location", "User", "Session", function($scope, $location, User, Session) {
  $scope.sign_in = function() {
    FormControls.clearErrors("#form_sign_in");
    Session.save($scope.newSession, function(data) {
      $location.path("/tasks");
    }, function(error_data) {
      console.log(error_data);
      FormControls.showMessage("#form_sign_in", error_data.data.message, "danger");
    });
  };

  $scope.sign_up = function() {
    FormControls.clearErrors("#form_sign_up");
    User.save({}, {user: $scope.newUser}, function(data) {
      $location.path("/tasks");
    }, function(error_data) {
      FormControls.showMessage("#form_sign_up", "Some errors occurred.", "danger");
      FormControls.addErrors("#form_sign_up", error_data.data.errors);
    });
  };
}]);