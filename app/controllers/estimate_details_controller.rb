class EstimateDetailsController < ApplicationController
  def create
    @estimate_details = EstimateDetail.new(estimate_detail_params)
    if @estimate_details.save
      estimate = @estimate_details.estimate_category.estimate
      flash[:success] = "見積もり明細を登録しました"
      redirect_to estimate_path(estimate)
    else
      # render_index()
    end
  end

  def update
  end

  def destroy
  end

  private

  def estimate_detail_params
    params
      .require(:estimate_detail)
      .permit(EstimateDetail::REGISTRABLE_ATTRIBUTES)
  end
end
