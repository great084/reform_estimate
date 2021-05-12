# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

if ENV["RACK_ENV"] == "production"
  require "rack/rewrite"
  use Rack::Rewrite do
    r301(/.*/, "https://www.reform-estimate.com$&", if: proc {|rack_env|
      rack_env["SERVER_NAME"] == "reform-estimate.herokuapp.com"
    })
  end
end

run Rails.application