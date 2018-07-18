require 'dotenv/load'
require 'bunny'
require 'pg'
require 'sequel'
require 'sneakers'
require 'sneakers/runner'

class Processor
  include Sneakers::Worker
  from_queue :archival
  def work(msg)
    if msg == 'run'
      db = Sequel.connect(ENV['DATABASE_URL'])
      puts db.run('select archive.run_archival()')
    end
  end
end

opts = {
  :amqp => ENV['CLOUDAMQP_URL']
}

Sneakers.configure(opts)
r = Sneakers::Runner.new([Processor])
r.run
