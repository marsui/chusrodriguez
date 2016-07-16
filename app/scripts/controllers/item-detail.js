'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:DressDetailCtrl
 * @description
 * # DressDetailCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('ItemDetailCtrl', ['Dresses', 'Photos', 'Accessories', '$routeParams', 'common', '$location', function (Dresses, Photos, Accessories, $routeParams, common, $location) {
    var itemId = $routeParams.id;
    var source = $routeParams.source;

    var api = source === 'dress' ? Dresses : Accessories;

    this.currentPhoto = null;

    var that = this;
    this.item = api.get({id:itemId},
      function success(data) {
        that.currentPhoto = data.image_url;
      });

    this.photos = Photos.search({source: source, item_id: itemId});

    this.back = function() {

    };

    this.requestInfo = function () {
      var info = {
        source: source,
        item: this.item
      };
      common.store('request-info', info);
      $location.path('/contact');

    };
  }]);

