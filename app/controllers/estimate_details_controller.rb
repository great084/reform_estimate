class EstimateDetailsController < ApplicationController
  def create
    @estimate_detail = EstimateDetail.new(estimate_detail_params)
    estimate = @estimate_detail.estimate_category.estimate
    # binding.pry
    if @estimate_detail.save
      flash[:success] = '見積明細を登録しました'
      redirect_to estimate_path(estimate)
    else
      # エラー処理は今後書く
      flash.now[:danger] = '見積明細の登録できませんでした'
    end
  end

  def update
  end

  def destroy
  end

  def details
    @price_table = PriceTable.find_by(id: params[:price_table_id])
  end

  private

    def estimate_detail_params
      params
        .require(:estimate_detail)
        .permit(EstimateDetail::REGISTRABLE_ATTRIBUTES)
    end
end
