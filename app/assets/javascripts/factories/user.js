angular.module("todoApp").factory("User", ["$resource", function($resource) {
  return $resource("/api/users");
}]);