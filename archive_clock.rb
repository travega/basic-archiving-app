require "bunny"
require 'dotenv/load'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new
scheduler.in '1m' do
  send_archival_command
end
scheduler.join

def send_archival_command
  b = Bunny.new ENV['CLOUDAMQP_URL']
  b.start # start a communication session with the amqp server
  q = b.queue 'archival' # declare a queue
  q.publish 'run' # publish a message to the queue
end
