
require 'artoo'

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

connection :navigation, :adaptor => :ardrone_navigation, :port => '192.168.1.1:5554'
device :nav, :driver => :ardrone_navigation, :connection => :navigation

work do
  on drone, :ready => :fly
  drone.start(nav)
end

def fly(*data)
  puts "Taking off"
  drone.take_off
  sleep 5

  puts "Going up"
  drone.up(0.5)
  sleep 1

  puts "Hovering"
  drone.hover
  sleep 10

  puts "Going left"
  drone.turn_left(0.5)
  sleep 1

  puts "No more left"
  drone.left(0)
  sleep 1

  # puts "Going right"
  # drone.right(0.5)
  # sleep 2

  puts "Going down"
  drone.down(1)
  sleep 2


  # drone.turn_right(1.0)
  # sleep 5
  # drone.turn_left(1.0)
  # sleep 5

  puts "Landing"
  drone.hover.land
  sleep 5

  drone.stop
end
