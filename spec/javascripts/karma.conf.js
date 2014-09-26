module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '../../',


    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine'],


    // list of files / patterns to load in the browser
    files: [
      'http://localhost:3000/assets/application.js',
      'app/assets/javascripts/**/*.{coffee,js}',
      'node_modules/angular-mocks/angular-mocks.js',
      'spec/javascripts/**/*_spec.{coffee,js}'
    ],


    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
        '**/*.coffee': ['coffee']
      },

      coffeePreprocessor: {
        // options passed to the coffee compiler
        options: {
          bare: true,
          sourceMap: false
        },
        // transforming the filenames
        transformPath: function(path) {
          return path.replace(/\.coffee$/, '.js');
        }
    },


    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],


    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['PhantomJS'],

    plugins: [
      'karma-phantomjs-launcher',
      'karma-jasmine',
      "karma-coffee-preprocessor",
      "karma-sprockets"
    ],

    sprocketsPath: [
        'app/assets/javascripts'
    ],
    sprocketsBundles: [
        // 'core.js',
        // 'foundation.js',
        'application.js'
    ],


    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: true
  });
};