angular.module("todoApp").factory("Session", ["$resource", function($resource) {
  return $resource("/api/sessions", {}, {query: {method:"GET", isArray:false}});
}]);