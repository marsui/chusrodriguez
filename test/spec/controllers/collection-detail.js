'use strict';

describe('Controller: CollectionDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var CollectionDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CollectionDetailCtrl = $controller('CollectionDetailCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(CollectionDetailCtrl.awesomeThings.length).toBe(3);
  });
});
