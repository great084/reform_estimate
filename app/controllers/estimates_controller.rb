class EstimatesController < ApplicationController
  def index
    @estimates = current_user.estimates
  end

  def show
    @estimate = Estimate.find(params[:id])
    @estimate_categories = @estimate.estimate_categories
    @active_category = if params[:estimate_category_id]
                         @estimate_categories.find(params[:estimate_category_id])
                       else
                         @estimate_categories.first
                       end
    # @active_category = params[:estimate_category_id]
    # ?  @estimate_categories.find(params[:estimate_category_id]) : @estimate_categories.first
    @estimate_details = @active_category.estimate_details if @active_category
  end

  def new
    @estimate = Estimate.new
  end

  def create
    @estimate = Estimate.new(estimate_params)
    # binding.pry
    if @estimate.save
      redirect_to estimates_path, success: "見積 #{@estimate.subject}を登録しました"
    else
      render :new
    end
  end

  def edit
    @estimate = Estimate.find(params[:id])
  end

  def update
    @estimate = Estimate.find(params[:id])
    # binding.pry
    if @estimate.update(estimate_params)
      flash[:success] = '見積を更新しました'
      redirect_to edit_estimate_path(@estimate)
    else
      # puts "#{@estimate.errors.full_messages}"
      flash.now[:danger] = '見積更新できませんでした'
      render :edit
    end
  end

  private

    # def estimate_params
    #   params
    #     .require(:estimate)
    #     .permit(
    #       Estimate::REGISTRABLE_ATTRIBUTES +
    #       [estimate_details_attributes: EstimateDetail::REGISTRABLE_ATTRIBUTES]
    #     )
    # end
    def estimate_params
      params
        .require(:estimate)
        .permit(
          Estimate::REGISTRABLE_ATTRIBUTES +
          [estimate_categories_attributes: EstimateCategory::REGISTRABLE_ATTRIBUTES]
        )
    end
end
