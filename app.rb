ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './models/link.rb'
require 'sequel'
#Heroku configuration
Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/links' do
    Link.create(title: params[:title], url: params[:url])
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

