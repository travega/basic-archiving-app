require "bunny"
require 'dotenv/load'
require 'pg'
require 'sequel'

b = Bunny.new ENV['CLOUDAMQP_URL']
b.start # start a communication session with the amqp server
q = b.queue 'archival' # declare a queue

payload = q.pop # retrieve one message from the queue
puts "Payload: #{payload}"

if payload == 'run'
  db = Sequel.connect(ENV['DATABASE_URL'])
  db.run('select archive.run_archival()')
end
