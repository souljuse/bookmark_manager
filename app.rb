ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
# require './models/link.rb'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    p @links
    erb :links
  end

  get '/links/new' do
    erb :links_new
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    p @links
    p tag
    @links = tag ? tag.links : []
    erb :'links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
