# frozen_string_literal: true

# require 'rack/reloader'
# require 'pry'

class Application
  def call(_env)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ['Follow The Damn Train, CJ!']

    [status, headers, body]
  end
end

# use Rack::Reloader
run Application.new
