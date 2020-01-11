class SongsController < ApplicationController

  def index
    @songs = Song.all
  end
  
  def new
   @song = Song.new    
  end
  
  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to(songs_path)
    else
      render(:new)
    end
  end
  
  def edit
    @song = Song.find(params[:id]) 
  end

  def update 
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to(songs_path)
    else 
      render(:edit)
    end
  end
  
  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to(songs_path)
  end

end
