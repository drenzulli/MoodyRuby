class QuotesController < ApplicationController
  def new
  	@quote = Quote.new
  end

  def create
  	@quote = Quote.new(quote_params)
  	if @quote.save
  		redirect_to quotes_path
  	else
  		render 'new'
  	end
  end

  def index
  	@quotes = Quote.all
  end

  def edit
    @quote = Quote.find(params[:id])
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update_attributes(quote_params)
      redirect_to quotes_path(@quote.id)
    else
      render 'edit'
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_path
  end

  private

  def quote_params
  	params.require(:quote).permit(:feeling_id, :body)
  end
end
