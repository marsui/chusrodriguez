  'use strict';

  /**
   * @ngdoc overview
   * @name chusrodriguezApp
   * @description
   * # chusrodriguezApp
   *
   * Main module of the application.
   */
   angular
   .module('chusrodriguezApp', [
    'ngAnimate',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'facebook',
    'ui.bootstrap'
    ])
   .config(function ($routeProvider) {
    $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      controllerAs: 'main'
    })
    .when('/gallery', {
      templateUrl: 'views/gallery.html',
      controller: 'GalleryCtrl',
      controllerAs: 'gallery'
    })
    .when('/collection-list', {
      templateUrl: 'views/collection-list.html',
      controller: 'CollectionListCtrl',
      controllerAs: 'collectionList'
    })
    .when('/facebook', {
      templateUrl: 'views/modal.html',
      controller: 'ModalCtrl',
      controllerAs: 'modal'
      })
    .when('/instagram', {
      templateUrl: 'views/modal.html',
      controller: 'ModalCtrl',
      controllerAs: 'modal'
    })
    .when('/contact', {
      templateUrl: 'views/contact.html',
      controller: 'ContactCtrl', 
      controllerAs: 'contact'
    })
    .otherwise({
      redirectTo: '/'
    });
  })
  .config(function(FacebookProvider) {
    // Set your appId through the setAppId method or
    // use the shortcut in the initialize method directly.
    FacebookProvider.init('147456718974280');
  })

