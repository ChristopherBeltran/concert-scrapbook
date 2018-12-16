class VenuesController < ApplicationController
  use Rack::Flash

  get '/myvenues' do
    if logged_in?
      @user = current_user
      @concerts = @user.concerts
      @venues =[]
      @concerts.each do |concert|
        @venues << concert.venue
      end
      erb :"/venues/myvenues"
    else
      redirect '/login'
    end
  end


end
