require 'argus'
require 'socket'

puts ["trace", __LINE__]
socket = TCPSocket.open('192.168.1.1', 5555)
puts ["trace", __LINE__]
streamer = Argus::VideoStreamer.new(host: "192.168.1.1", port: 5555)
puts ["trace", __LINE__]
parser = Argus::PaVEParser.new(streamer)
puts ["trace", __LINE__]

puts "Creatig file"
h246_out = File.new("#{Time.now.to_i}.h246", "w+b")

puts "Streaming"
streamer.start_stream

while true do
  puts "Writing"
  h246_out.write parser.get_frame
  puts "Wrote"
end
