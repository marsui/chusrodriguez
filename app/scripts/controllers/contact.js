'use strict';


/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:ContactCtrl
 * @description
 * # ContactCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp')
  .controller('ContactCtrl', ['contact', 'common', '$filter', '$rootScope', function (contact, common, $filter, $rootScope) {
  	this.patterns = {
  		phone: /^[9|6|7][0-9]{8}$/
    };

    this.user = {
    	name: '',
    	phone: '',
    	email: '',
    	text: ''
    };

    var request = common.read('request-info');

    if (request) {
      common.deleteKey('request-info');
      var source = $filter('itemName')(request.source);
      this.user.text = 'Me gustaría que me enviáseis más información sobre el ' + source + ' ' + request.item.name;
    }

    this.contact = function(){
    	var result = contact.send(this.user);

    	$rootScope.operations.notify("Mensaje enviado","Tu mensaje ha sido enviado con éxito");

    	$rootScope.back();

    	return result;
    };
  }]);
