var studentCenterApp = angular.module('studentCenterApp', ['ngRoute', 'ui.bootstrap'])
    .config(function ($routeProvider, $locationProvider) {
        $routeProvider
            .when('/search', {
                templateUrl: 'search/index.html',
                controller: 'SearchCtrl'
            })
            .when('/dashboard', {
                templateUrl: 'dashboard/index.html',
                controller: 'DashboardCtrl'
            })
            .when('/person/view/:personId', {
                templateUrl: 'person/index.html',
                controller: 'PersonCtrl'
            })
            .when('/person/create', {
                templateUrl: 'person/index.html',
                controller: 'PersonCtrl'
            });
    });

/*studentCenterApp.directive('postRender', ['$timeout',
    function ($timeout) {
        return {
            restrict: 'A',
            //terminal: false,
            //transclude: true,
            scope: {
                firstName: '@'
            },
            template: 'Name : {{ firstName }}',
            link: function (scope, element, attrs) {
                $timeout(function () {
                    alert($('#postRender').html());
                }); //Calling a scoped method
            }
        };
}]);*/