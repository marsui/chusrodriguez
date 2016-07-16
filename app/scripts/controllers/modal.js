'use strict';

/**
 * @ngdoc function
 * @name chusrodriguezApp.controller:FacebookCtrl
 * @description
 * # FacebookCtrl
 * Controller of the chusrodriguezApp
 */
angular.module('chusrodriguezApp', ['ngAnimate', 'ui.bootstrap'])
  .controller('ModalCtrl', function ($scope,$window) {
// angular.module('ui.bootstrap.demo').controller('ModalDemoCtrl', function ($scope, $uibModal, $log) {

  $scope.items = ['item1', 'item2', 'item3'];

  $scope.animationsEnabled = true;

  

  $scope.toggleAnimation = function () {
    $scope.animationsEnabled = !$scope.animationsEnabled;
  };

});

// Please note that $uibModalInstance represents a modal window (instance) dependency.
// It is not the same as the $uibModal service used above.

angular.module('chusrodriguezApp').controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, items) {

  $scope.items = items;
  $scope.selected = {
    item: $scope.items[0]
  };

  $scope.ok = function () {
    $uibModalInstance.close($scope.selected.item);
  };

  $scope.cancel = function () {
    $uibModalInstance.dismiss('cancel');
  };
});
  });


