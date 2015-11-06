class SubscriptionsController < ApplicationController
  # def new
  #   plan = Plan.find(params[:plan_id])
  #   @subscription = plan.subscriptions.build
  #   if params[:PayerID]
  #     @subscription.paypal_customer_token = params[:PayerID]
  #     @subscription.paypal_payment_token = params[:token]
  #     @subscription.email = @subscription.paypal.checkout_details.email
  #   end
  # end
  def paypal_checkout
    plan = Plan.where(name: params[:plan_name])
    subscription = plan.subscriptions.build
    redirect_to subscription.paypal.checkout_url(
      return_url: new_subscription_url(:plan_name => plan.id),
      cancel_url: root_url
    )
  end
end
