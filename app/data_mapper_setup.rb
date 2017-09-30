require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'

require pry

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
binding.pry
DataMapper.finalize
DataMapper.auto_upgrade!
