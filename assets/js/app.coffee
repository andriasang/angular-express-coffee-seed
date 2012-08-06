"use strict"

# LogCtrl = ($scope, $log) ->
#   $scope.$log = $log
#   $scope.message = 'Hello World!'


IndexCtrl = ($scope, $http) ->
  # $http.get("/api/posts").success (data, status, headers, config) ->
  #   $scope.posts = data.posts
  # $http.get("/api/posts").success (data, status, headers, config) ->
  #   $scope.posts = data.posts


angular.module("myApp", [ "myApp.filters", "myApp.services", "myApp.directives" ]).config [ "$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
  $routeProvider.when("/",
    templateUrl: "/partials/index"
    controller: IndexCtrl
  ).otherwise redirectTo: "/"
  $locationProvider.html5Mode true
 ]

