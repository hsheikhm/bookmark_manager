ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './models/data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/' do
    p 'HERE it is'
    p ENV['RACK_ENV']
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
    link = Link.create(:url => params[:url], :title => params[:title])
    tag = Tag.create(:tag => params[:tag])
    link.tags << tag
    link.save
    redirect('/links/index')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
