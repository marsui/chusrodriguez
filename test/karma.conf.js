// Karma configuration
// http://karma-runner.github.io/0.12/config/configuration-file.html
// Generated on 2016-02-19 using
// generator-karma 1.0.1

module.exports = function(config) {
  'use strict';

  config.set({
    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,

    // base path, that will be used to resolve files and exclude
    basePath: '../',

    // testing framework to use (jasmine/mocha/qunit/...)
    // as well as any additional frameworks (requirejs/chai/sinon/...)
    frameworks: [
      "jasmine"
    ],

    // list of files / patterns to load in the browser
    files: [
      // bower:js
      'bower_components/es5-shim/es5-shim.js',
      'bower_components/jquery/dist/jquery.js',
      'bower_components/angular/angular.js',
      'bower_components/bootstrap/dist/js/bootstrap.js',
      'bower_components/angular-animate/angular-animate.js',
      'bower_components/angular-resource/angular-resource.js',
      'bower_components/angular-route/angular-route.js',
      'bower_components/angular-sanitize/angular-sanitize.js',
      'bower_components/angular-touch/angular-touch.js',
      'bower_components/angular-facebook/lib/angular-facebook.js',
      'bower_components/angular-bootstrap/ui-bootstrap-tpls.js',
      'bower_components/lodash/dist/lodash.compat.js',
      'bower_components/shifty/dist/shifty.min.js',
      'bower_components/underscore/underscore.js',
      'bower_components/rekapi/dist/rekapi.min.js',
      'bower_components/spark-scroll/src/spark-scroll.js',
      'bower_components/moment/moment.js',
      'bower_components/angular-bootstrap-datetimepicker/src/js/datetimepicker.js',
      'bower_components/angular-cookies/angular-cookies.js',
      'bower_components/angular-translate/angular-translate.js',
      'bower_components/angular-dialog-service/dialogs.min.js',
      'bower_components/angular-dialog-service/dialogs-default-translations.min.js',
      'bower_components/angular-strap/dist/angular-strap.js',
      'bower_components/angular-strap/dist/angular-strap.tpl.js',
      'bower_components/angular-translate-loader-static-files/angular-translate-loader-static-files.js',
      'bower_components/fullcalendar/dist/fullcalendar.js',
      'bower_components/angular-ui-calendar/src/calendar.js',
      'bower_components/jquery-ui/jquery-ui.js',
      'bower_components/angular-ui-sortable/sortable.js',
      'bower_components/angular-ui-tree/dist/angular-ui-tree.js',
      'bower_components/json3/lib/json3.js',
      'bower_components/ng-file-upload/ng-file-upload.js',
      'bower_components/konga/lib/konga.js',
      'bower_components/aws-sdk/dist/aws-sdk.js',
      'bower_components/rangy/rangy-core.js',
      'bower_components/rangy/rangy-classapplier.js',
      'bower_components/rangy/rangy-highlighter.js',
      'bower_components/rangy/rangy-selectionsaverestore.js',
      'bower_components/rangy/rangy-serializer.js',
      'bower_components/rangy/rangy-textrange.js',
      'bower_components/textAngular/dist/textAngular.js',
      'bower_components/textAngular/dist/textAngular-sanitize.js',
      'bower_components/textAngular/dist/textAngularSetup.js',
      'bower_components/angular-mocks/angular-mocks.js',
      // endbower
      "app/scripts/**/*.js",
      "test/mock/**/*.js",
      "test/spec/**/*.js"
    ],

    // list of files / patterns to exclude
    exclude: [
    ],

    // web server port
    port: 8080,

    // Start these browsers, currently available:
    // - Chrome
    // - ChromeCanary
    // - Firefox
    // - Opera
    // - Safari (only Mac)
    // - PhantomJS
    // - IE (only Windows)
    browsers: [
      "PhantomJS"
    ],

    // Which plugins to enable
    plugins: [
      "karma-phantomjs-launcher",
      "karma-jasmine"
    ],

    // Continuous Integration mode
    // if true, it capture browsers, run tests and exit
    singleRun: false,

    colors: true,

    // level of logging
    // possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO,

    // Uncomment the following lines if you are using grunt's server to run the tests
    // proxies: {
    //   '/': 'http://localhost:9000/'
    // },
    // URL root prevent conflicts with the site root
    // urlRoot: '_karma_'
  });
};
