# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
use Rack::SSL if %w{1 true yes}.include?(ENV["FORCE_SSL"])
run Dorian::Application
