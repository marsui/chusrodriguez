'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:ContactCtrl
 * @description
 * # ContactCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('ContactCtrl', function () {
  	this.patterns = {
  		phone: /^[9|6|7][0-9]{8}$/

  	}
    this.user = {
    	name: '',
    	phone: ''
    };
  });
