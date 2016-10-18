require 'sinatra/base'
require './spec/spec_helper'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/links' do
  	@links = Link.all
  	erb :links
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
