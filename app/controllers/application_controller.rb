require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'

    enable :sessions
    set :session_secret, 'password_security'
  end

  get '/' do
    erb :index
  end

  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/'
    end
  end


  def logged_in?
    !!session[:user_id]
  end

  def current_user
    User.find(session[:user_id])
  end



end
