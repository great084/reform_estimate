class EstimatesController < ApplicationController
  def index
    @estimates = current_user.estimates
  end

  def show
    @estimate = Estimate.find(params[:id])
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params)
    if @estimate.save
      flash.now[:success] = "見積を作成しました"
      redirect_to estimates_path
    else
      puts "#{@estimate.errors.full_messages}"
      flash.now[:danger] = "見積作成に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def estimate_params
    params.require(:estimate).permit(:user_id, :subject, :customer_name)
  end

end
