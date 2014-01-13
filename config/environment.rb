# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
SimpleSocial::Application.initialize!

Time::DATE_FORMATS[:format_time] = ("%D at %r")
