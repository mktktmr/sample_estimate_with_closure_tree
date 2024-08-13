class EstimatesController < ApplicationController
  def index
    @estimates = Estimate.all
  end

  def show
    @estimate = Estimate.find(params[:id])

    redirect_to estimate_detail_path(@estimate.root_estimate_detail.id)
  end
end
