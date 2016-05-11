'use strict';

describe('The contact controller', function () {

  // load the controller's module
  beforeEach(module('chusrodriguezApp'));

  var ContactCtrl,
  scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    ContactCtrl = $controller('ContactCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  describe('should handle a user object', function() {

    it('that is not falsy', function () {
      expect(ContactCtrl.user).not.toBeFalsy();
    });

    it('that contain a name parameter', function () {
      expect(ContactCtrl.user.name).not.toBeUndefined();
    });

    it('that is a string', function () {
      expect(typeof(ContactCtrl.user.name)).toBe('string');
    });

    it('that contain a phone parameter', function () {
      expect(typeof(ContactCtrl.user.name)).toBe('string');
    });

  })

  it('should return ok if validating a correct phone number', function () {
    expect("664689699".match(ContactCtrl.patterns.phone)).not.toBe(null);
  });

  it('should return wrong if validating an incorrect phone number', function () {
    expect("abfghleiurd".match(ContactCtrl.patterns.phone)).toBe(null);
  });
});
