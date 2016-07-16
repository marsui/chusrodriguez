'use strict';

describe('Filter: itemName', function () {

  // load the filter's module
  beforeEach(module('chusrodriguezApp'));

  // initialize a new instance of the filter before each test
  var itemName;
  beforeEach(inject(function ($filter) {
    itemName = $filter('itemName');
  }));

  it('should return the input prefixed with "itemName filter:"', function () {
    var text = 'angularjs';
    expect(itemName(text)).toBe('itemName filter: ' + text);
  });

});
