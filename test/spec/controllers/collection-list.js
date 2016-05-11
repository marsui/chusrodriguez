'use strict';

xdescribe('Controller: CollectionListCtrl', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var CollectionListCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    CollectionListCtrl = $controller('CollectionListCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(CollectionListCtrl.awesomeThings.length).toBe(3);
  });
});
