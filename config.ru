# frozen_string_literal: true

class Application
  def call(_env)
    status = 200
    headers = { 'Content-Type' => 'text/html' }
    body = ['Follow The Damn Train, CJ!']

    [status, headers, body]
  end
end

run Application.new
