class ConcertsController < ApplicationController

  get '/myconcerts' do
    if logged_in?
      @user = current_user
      @concerts = @user.concerts
      erb :"/concerts/myconcerts"
    else
      redirect '/login'
    end
  end

end
