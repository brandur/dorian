require 'app_extensions'
require 'configurable_extensions'

class App < Configurable # :nodoc:
  extend AppExtensions
  extend ConfigurableExtensions

  # Settings in config/app/* take precedence over those specified here.
  config.name = Rails.application.class.parent.name

  # Personal information
  config.full_name    = 'Brandur Leach'
  config.display_name = 'brandur'

  # Configure modules below, comment the entire block out to disable a module

  for_module(:blog) do |mod|
    # Your blog's Atom feed
    mod.atom = 'http://mutelight.org/atom.xml'
  end

  for_module(:twitter) do |mod|
    # Your Twitter account's RSS feed
    mod.rss = 'http://twitter.com/statuses/user_timeline/22980330.rss'
  end
end
