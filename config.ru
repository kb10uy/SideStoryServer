# This file is used by Rack-based servers to start the application.
RAILS_RELATIVE_URL_ROOT="/"
require ::File.expand_path('../config/environment',  __FILE__)
run Rails.application
