class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :books
  end

  get '/seasons' do
    erb :books
  end

  get '/add_book' do
    erb :add_book
  end

  post '/add_book' do
    @book = Book.create(
      title: params["title"],
      author: params["author"],
      season: params["season"]
    )

    erb :book
  end

  post '/remove_book' do
    book = Book.find_by(title: params["title"])
    book.destroy! if book.present?

    erb :books
  end

  get '/members' do
    erb :members
  end

  get '/member_refresh' do
    erb :member_refresh
  end

  get '/book/:name' do
    @show_removal = params["remove"] == "true" ? true : false
    @book = Book.find_by(title: params["name"])

    erb :book
  end
end
