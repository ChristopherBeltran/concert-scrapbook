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
  @artist = Artist.find_by_slug(params[:slug])
  @concerts = @artist.concerts
  erb :"/artists/show"
end


end
