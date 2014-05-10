class MoodsController < ApplicationController
  def new
  	  @mood = Mood.new
  end

  def create
  	@mood = Mood.new(mood_params)
    if @mood.user_id != current_user.id
      redirect_to root_path
    else
  	 if @mood.save
       blowerio = RestClient::Resource.new(ENV['BLOWERIO_URL'])
       blowerio['/messages'].post :to => '+' << @mood.phonenumber, :message => "New mood " + @mood.feeling + " was created!"
  	   redirect_to moods_path
  	 else
  	   render 'new'
  	 end
    end
  end

  def index
  	 @moods = Mood.all.order(:feeling).limit(10)
  end

  def show
    @mood = Mood.find(params[:id])
    @quotes = Quote.where(feeling_id: @mood.id).limit(3)
  end

  def edit
    @mood = Mood.find(params[:id])
  end

  def update
    @mood = Mood.find(params[:id])
    if @mood.user_id != current_user.id
      render 'edit'
    else
      if @mood.update_attributes(mood_params)
        redirect_to moods_path(@mood.id)
      else
        render 'edit'
      end
    end
  end

  def destroy
    @mood = Mood.find(params[:id])
    @mood.destroy
    redirect_to root_path
  end

  private

  def mood_params
  	params.require(:mood).permit(:feeling, :adjective, :phonenumber, :user_id)
  end

end
