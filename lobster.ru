# frozen_string_literal: true

require 'rack/lobster'
require 'thin'

app = Rack::Builder.new do
  use Rack::CommonLogger
  use Rack::ShowExceptions
  map '/lobster' do
    use Rack::Lint
    run Rack::Lobster.new
  end
end

Rack::Handler::Thin.run app
