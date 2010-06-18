require 'rubygems'
require 'mongrel'

class Handler < Mongrel::HttpHandler
  def process(request, response)
    response.start(200) do |head, out|
      head["Content-Type"] = "text/html"
      out.write "Hello world\n"
    end
  end
end

server = Mongrel::HttpServer.new("0.0.0.0", 3000)
server.register("/", Handler.new) 
server.run.join
