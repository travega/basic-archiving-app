require 'sequel'
require 'dotenv/load'
require 'rufus-scheduler'

def self.send_archival_command
  db = Sequel.connect(ENV['DATABASE_URL'])
  db.run('select archive.run_archival()')
  puts 'Archival task run!'
end

scheduler = Rufus::Scheduler.new
scheduler.in '5s' do
  send_archival_command
end

scheduler.join
