require 'artoo'


connection :videodrone, :adaptor => :ardrone_video, :port => '192.168.1.1:5555'
device :video, :driver => :ardrone_video, :connection => :videodrone

connection :navigation, :adaptor => :ardrone_navigation, :port => '192.168.1.1:5554'
device :nav, :driver => :ardrone_navigation, :connection => :navigation

work do
  on video, :frame => :v_frame
end

def v_frame(*data)
  @count ||= 0
  @count += 1
  puts "Frame # #{@count}"
  puts "#{data[1].size} bytes"
  
end
