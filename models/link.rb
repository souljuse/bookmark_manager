require 'data_mapper'
require 'dm-postgres-adapter'


class Link

	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :url,  String


end
# DataMapper.setup(:default, "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
#Heroku configuration
Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.finalize
DataMapper.auto_upgrade!
