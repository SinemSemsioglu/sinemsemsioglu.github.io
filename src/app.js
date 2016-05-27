'use strict';

// Declare src level module which depends on views, and components
angular.module("personalWeb", [
   "ui.router"
]);

angular.module("personalWeb").config(function ($stateProvider, $urlRouterProvider) {
    $stateProvider
        .state("home", {
            "url": "/home",
            "views": {
                "appContainer@": {
                    "controller": "homeController as home",
                    "templateUrl": "templates/home/home.html"
                }
            }
        }).state("portfolio", {
            "url": "/portfolio",
            "views": {
                "appContainer@": {
                    "controller": "portfolioController as portfolio",
                    "templateUrl": "templates/portfolio/portfolio.html"
                }
            }
        });

    $urlRouterProvider.otherwise("/home");
});
