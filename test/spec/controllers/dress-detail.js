'use strict';

describe('Controller: DressDetailCtrl', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var DressDetailCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DressDetailCtrl = $controller('DressDetailCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(DressDetailCtrl.awesomeThings.length).toBe(3);
  });
});
