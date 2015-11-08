class PlansController < ApplicationController
	before_action :set_plan, only: [:edit, :update]

  def index
    @plans = Plan.all
  end
  
  def update
    respond_to do |format|
      format.html { redirect_to paypal_checkout_path(plan_id: @plan.id, link_count: params[:count]) }
    end
  end

  def edit
  end

  private 
    def set_plan
      @plan = Plan.find(params[:id])
    end
end
