require 'sequel'

if  ENV['RACK_ENV'] == 'development'
  require 'dotenv/load'
end

db = Sequel.connect(ENV['DATABASE_URL'])
db.run('select archive.run_archival()')
puts 'Archival task run!'
