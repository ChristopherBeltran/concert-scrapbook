class ArtistsContoller < ApplicationController
  use Rack::Flash

  get '/myartists' do
    if logged_in?
      @user = current_user
      @concerts = @user.concerts
      x =[]
      @concerts.each do |concert|
        x << concert.artist
        @artists = x.uniq
      end
      erb :"/artists/myartists"
    else
      redirect '/login'
    end
  end

  get '/myartists/:slug' do
    if logged_in?
  @artist = Artist.find_by_slug(params[:slug])
  @user = current_user
  @concerts = @user.concerts
  @artist_concerts = []
  @concerts.each do |concert|
    if concert.artist == @artist
      @artist_concerts << concert
    end
  end
  erb :"/artists/show"
else
  redirect '/login'
end 
end


end
