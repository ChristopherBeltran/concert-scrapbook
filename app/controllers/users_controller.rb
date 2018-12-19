require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
      if logged_in?
        redirect '/myconcerts'
        else
        erb :"/users/create_user"
      end
    end

  post '/signup' do
      if EmailValidator.valid?(params[:email]) == false
        flash[:error] = "Please enter a valid email address."
        redirect '/signup'
      elsif
        params[:password] != params[:password_repeat]
        flash[:error] = "Passwords must match.  Please re-enter password."
        redirect '/signup'
      elsif
        User.exists?(username: params[:username])
        flash[:error] = "Username already in use, please choose a new username."
        redirect '/signup'
      elsif
        User.exists?(email: params[:email])
        flash[:error] = "Email already in use, please log in to account."
        redirect '/login'
    else
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user.save
        session[:user_id] = @user.id
        flash[:message] = "Account successfully created!"
        redirect :"/users/#{@user.slug}"
    end
  end

  get '/login' do
    if logged_in?
    redirect :"/users/#{current_user.slug}"
  else
    erb :"/users/login"
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username]) || User.find_by(:email => params[:email])
	   if @user && @user.authenticate(params[:password])
		 session[:user_id] = @user.id
		 redirect :"/users/#{@user.slug}"
	else
    flash[:error] = "The username and password you entered did not match our records.  Please double check and try again."
		 redirect '/login'
	 end
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = current_user
    @concerts = @user.concerts
    erb :"/users/show"
  end

  get '/logout' do
		  session.clear
      flash[:message] = "You have been successfully logged out."
		  redirect '/'
	end

end
