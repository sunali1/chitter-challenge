require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'

# require 'pry'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
# binding.pry
DataMapper.finalize
DataMapper.auto_upgrade!
