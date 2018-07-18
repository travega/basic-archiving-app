require "bunny"
require 'dotenv/load'
require 'rufus-scheduler'

def self.send_archival_command
  bunny = Bunny.new ENV['CLOUDAMQP_URL']
  bunny.start # start a communication session with the amqp server
  channel = bunny.create_channel
  queue = channel.queue 'archival' # declare a queue
  queue.publish 'run' # publish a message to the queue
  puts 'Archive command sent'
end

scheduler = Rufus::Scheduler.new
scheduler.in '5s' do
  send_archival_command
end
scheduler.join
