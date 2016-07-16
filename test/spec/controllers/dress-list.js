'use strict';

describe('Controller: DressListCtrl', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var DressListCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    DressListCtrl = $controller('DressListCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(DressListCtrl.awesomeThings.length).toBe(3);
  });
});
