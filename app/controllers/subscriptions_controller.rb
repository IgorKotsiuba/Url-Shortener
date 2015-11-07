class SubscriptionsController < ApplicationController

  def new
    plan = Plan.where(name: params[:plan_name]).first
    @subscription = plan.subscriptions.build
    if params[:PayerID]
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
      @subscription.email = @subscription.paypal.checkout_details.email
    end
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save_with_payment
      redirect_to root_url, :notice => "Thank you for subscribing!"
    else
      render :new
    end
  end

  def paypal_checkout
    plan = Plan.where(name: params[:plan_name]).first
    subscription = plan.subscriptions.build
    redirect_to subscription.paypal.checkout_url(
      return_url: new_subscription_url(:plan_name => plan.name),
      cancel_url: root_url
    )
  end

  private

    def subscription_params
      params.require(:subscription).permit(:plan_id, :paypal_customer_token, :paypal_payment_token, :email)
    end
end
