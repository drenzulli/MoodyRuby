class MoodsController < ApplicationController
  def new
  	@mood = Mood.new
  end

  def create
  	@mood = Mood.new(mood_params)
  	if @mood.save
  		redirect_to moods_path
  	else
  		render 'new'
  	end
  end

  def index
  	@moods = Mood.all
  end

  def show
    @mood = Mood.find(params[:id])
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def update
    @mood = Mood.find(params[:id])
    if @mood.update_attributes(mood_params)
      redirect_to moods_path(@mood.id)
    else
      render 'edit'
    end
  end

  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to moods_path
  end

  private

  def mood_params
  	params.require(:mood).permit(:feeling, :adjective, :user_id)
  end

end
