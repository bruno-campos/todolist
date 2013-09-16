var todoApp = angular.module("todoApp", ["ngResource"]);

angular.module("todoApp").config(function ($provide, $httpProvider) {
  $provide.factory('httpInterceptor', ["$q", "$location", function($q, $location) {
    return function(promise) {
      return promise.then(function(response) {
        return response;
      }, function(response) {
        // go to login page if unauthorized exception
        if(response.status == 401 && $location.path() != "/login") {
          $location.path("/login");
        }
        return $q.reject(response);
      });
    }
  }]);
  $httpProvider.responseInterceptors.push('httpInterceptor');
});

angular.module("todoApp").config(function($routeProvider, $locationProvider) {
  $routeProvider
      .when("/login", {
        templateUrl: "assets/login.html",
        controller: "LoginController"
      })
      .when("/tasks", {
        templateUrl: "assets/tasks.html",
        controller: "TasksController"
      })
      .otherwise({redirectTo: "/tasks"});
});

angular.module("todoApp").config(function($httpProvider) {
  var authToken = $('meta[name="csrf-token"]').attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;
});

angular.module("todoApp").factory("Session", ["$resource", function($resource) {
  return $resource("/api/sessions");
}]);

angular.module("todoApp").service("UserSession", ["$http", "$q", "Session", function($http, $q, Session) {
  var logged_in = false;
  return {

  };
}]);