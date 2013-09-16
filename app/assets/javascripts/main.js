var todoApp = angular.module("todoApp", ["ngResource"]);

angular.module("todoApp").config(function ($provide, $httpProvider) {
  $provide.factory('httpInterceptor', ["$q", "$location", function($q, $location) {
//    return  {
//      'response': function(response) {
//        // do something on success
//        console.log(response);
//        return response || $q.when(response);
//      }
//    }
    return function(promise) {
      return promise.then(function(response) {
        // do something on success
        return response;
      }, function(response) {
        // do something on error
        if(response.status == 401) {
          $location.path("/login");
        }
        return $q.reject(response);
      });
    }
  }]);
  $httpProvider.responseInterceptors.push('httpInterceptor');
});

var rand = new Date().getMilliseconds().toString();

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

angular.module("todoApp").config(["$locationProvider", function($locationProvider) {
  //$locationProvider.html5Mode(true);
}]);







angular.module("todoApp").factory("Session", ["$resource", function($resource) {
  return $resource("/api/sessions");
}]);

angular.module("todoApp").service("user", [function($http, $q) {
  var logged_in = false;
  return {

  };
}]);

var FormControls = {
  showMessage: function(el, message, type) {
    var class_type = (!!type) ? "alert-" + type  : "";
    $(el).prepend("<div class='alert " + class_type + "'>"  + message + "</div>");
  },
  addErrors: function(el, error_list) {
    for(key in error_list) {
      $(el).find(".controls-" + key).addClass("has-error");
      $(el).find(".controls-" + key).append("<span class='help-block'>" + error_list[key] + "</span>");
    }
  },
  clearErrors: function(el) {
    $(".form-group", el).removeClass("has-error");
    $(".help-block", el).remove();
    $(".alert", el).remove();
  }
};

