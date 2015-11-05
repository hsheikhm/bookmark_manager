ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

require_relative 'models/user'

class BookmarkManager < Sinatra::Base
  set :sessions, true
  set :session_secret, 'super secret'

  get '/' do
    redirect('/signup')
  end

  get '/signup' do
    erb :'user/signup'
  end

  post '/details' do
    session[:username] = params[:username]
    @user = User.create(username: params[:username], email: params[:email], password_hash: params[:password])
    redirect('/welcome')
  end

  get '/welcome' do
    @user = User.first(username: session[:username])
    erb :'user/welcome'
  end

  get '/links/index' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag1 = Tag.first_or_create(tag: params[:tag1])
    tag2 = Tag.first_or_create(tag: params[:tag2])
    tag3 = Tag.first_or_create(tag: params[:tag3])
    link.tags << tag1 << tag2 << tag3
    link.save
    redirect('/links/index')
  end

  get '/tags/filter' do
    @tag = Tag.all(tag: params[:filter])
    @links = (@tag ? @tag.links : [])
    erb :'links/filter'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
