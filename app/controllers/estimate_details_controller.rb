class EstimateDetailsController < ApplicationController
  before_action :estimate_detail, only: %i[create update destroy]
  before_action :estimate_category, only: %i[create update destroy]
  before_action :estimate, only: %i[create update destroy]

  def create
    if @estimate_detail.save
      flash[:success] = '見積明細を登録しました'
      redirect_to estimate_path(@estimate, estimate_category_id: @estimate_category)
    else
      # エラー処理は今後書く
      flash.now[:danger] = '見積明細の登録できませんでした'
    end
  end

  def update
    if @estimate_detail.update(estimate_detail_params)
      flash[:success] = '見積明細を更新しました'
      redirect_to estimate_path(@estimate, estimate_category_id: @estimate_category)
    else
      # エラー処理は今後書く
      flash.now[:danger] = '見積明細の更新できませんでした'
    end
  end

  def destroy
    if @estimate_detail.destroy
      flash[:success] = '見積明細を削除しました'
      redirect_to estimate_path(@estimate, estimate_category_id: @estimate_category)
    else
      # エラー処理は今後書く
      flash.now[:danger] = '見積明細の削除できませんでした'
    end
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

    def estimate_detail
      @estimate_detail = if params[:id]
                           EstimateDetail.find(params[:id])
                         else
                           EstimateDetail.new(estimate_detail_params)
                         end
    end

    def estimate_category
      @estimate_category = estimate_detail.estimate_category
    end

    def estimate
      @estimate = estimate_detail.estimate_category.estimate
    end
end
