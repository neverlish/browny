class AnswersController < ApplicationController
	before_action :set_spot, except: [:index]
	before_action :set_ask, except: [:index]
	before_action :set_answer, only: [:show,:edit,:update,:destroy]
  def index
  	@asks = ask.all
  end

  def new
  	@ask = @spot.asks.new
  end
  def create
	@ask = @spot.asks.create(ask_params)
	@ask.user = current_user
	if @ask.save
		redirect_to @spot
	else
		render 'new'
	end
  end
  def show
  end
  def edit
  end
  def update
	if @post.save
		redirect_to @spot
	else
		render 'new'
	end
  end
  def destroy
  	@ask.destroy
  	redirect_to spot_path(@spot)
  end
  private
  def ask_params
  	params.require(:ask).permit(:body)
  end
  def set_spot
  	@spot = Spot.find(params[:spot_id])
  end
  def set_ask
  	@ask = Ask.find(params[:ask_id])
  end
  def set_answer
  	@answer = @ask.answers.find(params[:id])
  end
end

