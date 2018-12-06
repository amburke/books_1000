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

  get '/current_season' do
    @current_picker = AdminsAndBooks.current_picker
    @up_next = AdminsAndBooks.up_next
    @already_picked = AdminsAndBooks.already_picked
    @left_to_pick = AdminsAndBooks.left_to_pick

    erb :current_season
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
