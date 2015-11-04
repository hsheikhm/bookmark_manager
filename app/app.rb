require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    redirect('/links/index')
  end

  get '/links/index' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    Link.create(:url => params[:url], :title => params[:title])
    redirect('/links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
