class EstimatesController < ApplicationController
  def index
    @estimates = current_user.estimates
  end

  def show
    @estimate = Estimate.find(params[:id])
    @estimate_details = EstimateDetail.where(estimate_id: params[:id])
  end

  def new
    @estimate = Estimate.new
    # @estimate = Form::Estimate.new
  end

  def create
    # @estimate = Form::Estimate.new(estimate_params)
    @estimate = Estimate.new(estimate_params)
    debugger
    if @estimate.save
      redirect_to estimates_path, notice: "見積 #{@estimate.subject}を登録しました"
    else
      render :new
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
    # @estimate = Form::Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    # @estimate = Form::Estimate.find(params[:id])
    debugger
    if @estimate.update!(estimate_params)
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
    # params.require(:estimate).permit(:user_id, :subject, :customer_name)

    # params
      # .require(:form_estimate)
      # .permit(
      #   Form::Estimate::REGISTRABLE_ATTRIBUTES +
      #   [estimate_details_attributes: Form::EstimateDetail::REGISTRABLE_ATTRIBUTES]
      # )
      # params.require(:form_estimate).permit(:user_id, :subject, :customer_name, estimate_details_attributes: [:id, :unit_price, :quantity, :_destroy])
      # params.require(:estimate).permit(:user_id, :subject, :customer_name, estimate_details_attributes: [:id, :unit_price, :quantity, :_destroy])
    params
      .require(:estimate)
      .permit(
        Estimate::REGISTRABLE_ATTRIBUTES +
        [estimate_details_attributes: EstimateDetail::REGISTRABLE_ATTRIBUTES]
      )
  end

end
