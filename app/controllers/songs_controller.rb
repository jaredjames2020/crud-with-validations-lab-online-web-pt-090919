class SongsController < ApplicationController
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new(params)
  end
  
  def show
    @song = song_find
  end
  
  def edit
    @song = song_find
  end
  
  def create  
    @song = Song.new(song_params)
    
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def update
    
  end
  
  private
  
  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end
  
  def song_find
    Song.Find_by(params[:id])
  end

end
