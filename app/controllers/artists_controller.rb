class ArtistsController < ApplicationController
before_action :authenticate_user!
  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    if current_user && current_user.admin? || current_user.artist?
      @artist = Artist.new
    else
      redirect_to(artists_path)
    end
  end 

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to(artists_path)
    else
      render(:new)
    end
  end

  def edit
    if current_user && current_user.admin? ||  current_user.artist? 
      @artist = Artist.find(params[:id])
    else
      redirect_to(artists_path)
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to(artists_path)
    else
      render(:edit)
    end
  end

  def destroy
    if current_user && current_user.artist? || current_user.admin?
      @artist = Artist.find(params[:id])
      @artist.destroy
      redirect_to(artists_path)
    else
      redirect_to(artists_path)
    end
  end 

  private

  def artist_params
  params.require(:artist).permit(:name)
  end

end
