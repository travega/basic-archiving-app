require 'pg'
require 'sequel'

db = Sequel.connect(ENV['DATABASE_URL'])
db.run(File.read('./setup.sql'))
