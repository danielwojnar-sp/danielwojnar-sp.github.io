# frozen_string_literal: true

require 'socket'
require 'rack'

# Server
class Server
  RESPONSE_BODY = 'Hello World!'

  trap('INT') { puts 'Exiting'; exit }

  def self.start
    puts "Server started \u{1f308} \u{1f4AA}"

    server = TCPServer.new 3000
    counter = 0
    app = proc { ['200', { 'Content-Length' => RESPONSE_BODY.size }, RESPONSE_BODY] }

    loop do
      Thread.start(server.accept) do |client|
        counter += 1
        status, headers, body = app.call
        puts "There were #{counter} connections"
        client.print "HTTP/1.1 #{}r\n"
        headers.each { |k, v| client.print("#{k}: #{v}\r\n") }
        client.print "\r\n"
        client.print body
        client.close
      end
    end
  end
end
