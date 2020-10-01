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
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    if @estimate.update_attributes(estimate_params)
      flash.now[:success] = "見積を更新しました"
      redirect_to estimate_path(@estimate)
    else
      puts "#{@estimate.errors.full_messages}"
      flash.now[:danger] = "見積更新できませんでした"
      render :edit
    end
  end

  private

  def estimate_params
    params.require(:estimate).permit(:user_id, :subject, :customer_name)
  end

end
