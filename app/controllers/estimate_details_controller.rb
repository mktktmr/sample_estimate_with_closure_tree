class EstimateDetailsController < ApplicationController
  def show
    @estimate_detail = EstimateDetail.find(params[:id])
  end
end
