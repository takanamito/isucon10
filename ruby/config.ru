require 'stackprof'
require './app'

use StackProf::Middleware, enabled: true, mode: :cpu, interval: 1000, save_every: 5

# require 'raven'
# Raven.configure do |config|
#   config.dsn = 'https://46ecc72b938841c8a7d8eba7c8f6a41f@o173289.ingest.sentry.io/5422380'
# end
# use Raven::Rack

run App
