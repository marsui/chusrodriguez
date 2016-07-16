'use strict';

describe('Controller: AccessoriesCtrl', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var AccessoriesCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    AccessoriesCtrl = $controller('AccessoriesCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(AccessoriesCtrl.awesomeThings.length).toBe(3);
  });
});
