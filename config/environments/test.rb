Weeds::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # The tests environment is used exclusively to run your application's
  # tests suite. You never need to work with it otherwise. Remember that
  # your tests database is "scratch space" for the tests suite and is wiped
  # and recreated between tests runs. Don't rely on the data there!
  config.cache_classes = true

  # Do not eager load code on boot. This avoids loading your whole application
  # just for the purpose of running a single tests. If you are using a tool that
  # preloads Rails for running tests, you may have to set it to true.
  config.eager_load = false

  # Configure static asset server for tests with Cache-Control for performance.
  config.serve_static_assets  = true
  config.static_cache_control = "public, max-age=3600"

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates.
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in tests environment.
  config.action_controller.allow_forgery_protection = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :tests delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :tests

  # Print deprecation notices to the stderr.
  config.active_support.deprecation = :stderr
end
