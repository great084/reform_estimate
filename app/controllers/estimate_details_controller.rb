class EstimateDetailsController < ApplicationController
  def create
    @estimate_detail = EstimateDetail.new(estimate_detail_params)
    binding.pry
    if @estimate_detail.save
      estimate = @estimate_detail.estimate_category.estimate
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

  def ajax
    @specifications = PriceTable.find_by(category_id: params[:category_id], item_name: params[:item_name])
  end

  private

  def estimate_detail_params
    params
      .require(:estimate_detail)
      .permit(EstimateDetail::REGISTRABLE_ATTRIBUTES)
  end
end
