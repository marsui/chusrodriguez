'use strict';

describe('Service: metadata', function () {

  // load the service's module
  beforeEach(module('chusrodriguezApp'));

  // instantiate service
  var metadata;
  beforeEach(inject(function (_metadata_) {
    metadata = _metadata_;
  }));

  it('should do something', function () {
    expect(!!metadata).toBe(true);
  });

});
