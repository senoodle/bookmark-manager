require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Testing infrastructure working!'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  get '/bookmarks/add' do
    erb :'bookmarks/add'
  end

  # post '/bookmarks' do
  #   url = params['url']
  #   connection = PG.connect(dbname: 'bookmark_manager_test')
  #   connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  #   redirect '/bookmarks'
  # end
  
  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/bookmarks'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
