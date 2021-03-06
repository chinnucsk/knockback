try
  require.config({
    paths:
      'underscore': "../../vendor/underscore-1.4.4"
      'backbone': "../../vendor/backbone-1.0.0"
      'knockout': "../../vendor/knockout-2.2.1"
      'knockback': "../../knockback"
      'knockback-examples-localization': "../_examples/build/_localization_examples"
      'knockback-statistics': "../../lib/knockback-statistics"
    shim:
      underscore:
        exports: '_'
      backbone:
        exports: 'Backbone'
        deps: ['underscore']
  })

  module_name = 'knockback-defaults'
  module_name = 'knockback' if (require.toUrl(module_name).split('./..').length is 1)

  # library and dependencies
  require ['underscore', 'backbone', 'knockout', module_name, 'knockback-statistics', 'knockback-examples-localization', 'qunit_test_runner'], (_, Backbone, ko, kb, kbs, kbe, runner) ->
    window._ = window.Backbone = window.ko = window.kb = null # force each test to require dependencies synchronously
    require ['./build/test'], -> runner.start()