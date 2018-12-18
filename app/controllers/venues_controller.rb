class VenuesController < ApplicationController
  use Rack::Flash

  get '/myvenues' do
    if logged_in?
      @user = current_user
      @concerts = @user.concerts
      x =[]
      @concerts.each do |concert|
        x << concert.venue
        @venues = x.uniq
      end
      erb :"/venues/myvenues"
    else
      redirect '/login'
    end
  end

  get '/myvenues/:slug' do
  @venue = Venue.find_by_slug(params[:slug])
  @user = current_user
  @concerts = @user.concerts
  @venue_concerts = []
  @concerts.each do |concert|
    if concert.venue == @venue
      @venue_concerts << concert
    end
  end 
  erb :"/venues/show"
end


end
