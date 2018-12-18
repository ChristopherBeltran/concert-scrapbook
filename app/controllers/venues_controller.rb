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

  get '/myvenues/:slug' do
  @venue = Venue.find_by_slug(params[:slug])
  @concerts = @venue.concerts
  erb :"/venues/show"
end


end
