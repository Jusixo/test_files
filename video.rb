require 'argus'

streamer = Argus::VideoStreamer.new(host: "192.168.1.1", port: 5555)
streamer.start

puts "Started stream"

IO.popen("ffmpeg -i - -vcodec libx264 -y -threads 0 -vcodec libx264 video.mp4", "w+b") do |io|
  while true do
    data = streamer.receive_data.frame

    puts "Writing data"
    io.write data
    io.flush
  end
end
