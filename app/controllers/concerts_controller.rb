class ConcertsController < ApplicationController
  use Rack::Flash

  get '/myconcerts' do
    redirect_if_not_logged_in
      @user = current_user
      @concerts = @user.concerts
      erb :"/concerts/myconcerts"
  end

  get '/new-concert' do
    if logged_in?
      erb :"/concerts/new"
    else
      redirect '/login'
    end
  end

  post '/new-concert' do
    redirect_if_not_logged_in
    @user = current_user
    @concert = Concert.find_by(params[:concert])
      if @concert && @concert.artist.name == params[:artist][:name] && @concert.venue.name == params[:venue][:name]
        @user_concerts = @user.concerts
        @user_concerts.each do |concert|
          if concert == @concert
            flash[:error] = "Concert already exists. Please create a new concert."
            redirect '/new-concert'
          end
        end
      else
        @new_concert = Concert.create(params[:concert])
        @new_concert.artist = Artist.find_or_create_by(params[:artist])
        @new_concert.venue = Venue.find_or_create_by(params[:venue])
        @new_concert.user_id = @user.id
        @new_concert.save
        flash[:message] = "Concert successfully created!"
        redirect '/myconcerts'
      end
    end

get '/myconcerts/:id/edit' do
  redirect_if_not_logged_in
  @concert = Concert.find_by(params)
  if @concert && @concert.user_id == current_user.id
  @artist = @concert.artist
  @venue = @concert.venue
  erb :"/concerts/edit"
else
  redirect '/'
end
end

patch '/myconcerts/:id' do
  @concert = Concert.find_by(id: params[:id])
  @concert.update(params[:concert])
  @concert.artist = Artist.find_or_create_by(params[:artist])
  @concert.venue = Venue.find_or_create_by(params[:venue])
  @concert.save
  flash[:message] = "Successfully updated concert."
  redirect '/myconcerts'
end

delete '/myconcerts/:id/delete' do
  @concert = Concert.find_by(id: params[:id])
  @concert.delete
  flash[:message] = "Successfully deleted concert."
  redirect to '/myconcerts'
end


end
