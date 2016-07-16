'use strict';

describe('Service: accessories', function () {

  // load the service's module
  beforeEach(module('chusrodriguezApp'));

  // instantiate service
  var accessories;
  beforeEach(inject(function (_accessories_) {
    accessories = _accessories_;
  }));

  it('should do something', function () {
    expect(!!accessories).toBe(true);
  });

});
