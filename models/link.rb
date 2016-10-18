require 'data_mapper'
require 'dm-postgres-adapter'
require 'sequel'


class Link

	include DataMapper::Resource

	property :id, Serial
	property :title, String
	property :url,  String


end

#Heroku configuration
Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.finalize
DataMapper.auto_upgrade!
