'use strict';

describe('Service: dresses', function () {

  // load the service's module
  beforeEach(module('chusrodriguezApp'));

  // instantiate service
  var dresses;
  beforeEach(inject(function (_dresses_) {
    dresses = _dresses_;
  }));

  it('should do something', function () {
    expect(!!dresses).toBe(true);
  });

});
