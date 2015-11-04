require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'link'
require_relative 'tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#DataMapper.setup(:default, "postgres://localhost/bookmark_manager_development")

DataMapper.finalize
DataMapper.auto_upgrade!
