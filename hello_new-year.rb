#!/usr/bin/ruby

require 'socket'

server = TCPServer.new('localhost', 2017)


loop do 
  socket = server.accept
  request = socket.gets
  puts request
  time = Time.now
  if time.year == 2017
    response = "Happy New Year 2017"
  else
    response = "Still 2016"
  end
  puts response
  socket.print "HTTP/1.1 200 OK\r\nContent-Type: text/plain\r\nContent-Length: #{response.bytesize}\r\nConnection: close\r\n"
  socket.print "\r\n"
  socket.print response
  socket.close
end
