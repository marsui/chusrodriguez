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
    'ui.bootstrap',
    'gilbox.sparkScroll',
    'konga',
    'ngFileUpload'
    ])
   .config(function ($routeProvider) {
    $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      controllerAs: 'main'
    })
    .when('/collections', {
      templateUrl: 'views/collections.html',
      controller: 'CollectionListCtrl',
      controllerAs: 'collectionList'
    })
    .when('/dresses', {
      templateUrl: 'views/dresses.html', 
      controller: 'DressListCtrl',
      controllerAs: 'dressCtrl'
    })
    .when('/catalog/:source/:id', {
      templateUrl: 'views/item-detail.html',
      controller: 'ItemDetailCtrl', 
      controllerAs: 'itemDetail'
    })
    .when('/accessories', {
      templateUrl: 'views/accessories.html',
      controller: 'AccessoriesCtrl',
      controllerAs: 'accessoryCtrl'
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
    .when('/collection-detail/:id', {
      templateUrl: 'views/collection-detail.html',
      controller: 'CollectionDetailCtrl', 
      controllerAs: 'collectionDetail'
    })
    .when('/admin', {
      templateUrl: 'views/admin.html',
      controller: 'AdminCtrl', 
      controllerAs: 'adminController'
    })
    .otherwise({
      redirectTo: '/'
    });
  })

  .run(['konga', 'metadata', function(konga, metadata, Dresses) {
    konga.config('apiEndpoint', 'http://localhost:3000');
    konga.viewMapper('IMAGE_FIELD', 'views/admin/konga-image-field.html');

    konga.api('Dress', Dresses)
    konga.init(metadata);
  }]);
   

