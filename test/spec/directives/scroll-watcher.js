'use strict';

describe('Directive: scrollWatcher', function () {

  // load the directive's module
  beforeEach(module('chusrodriguezApp'));

  var element,
    scope;

  beforeEach(inject(function ($rootScope) {
    scope = $rootScope.$new();
  }));

  it('should make hidden element visible', inject(function ($compile) {
    element = angular.element('<scroll-watcher></scroll-watcher>');
    element = $compile(element)(scope);
    expect(element.text()).toBe('this is the scrollWatcher directive');
  }));
});
