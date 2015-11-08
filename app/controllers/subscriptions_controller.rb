class SubscriptionsController < ApplicationController

  def new
    plan = Plan.find(params[:plan_id])
    @subscription = plan.subscriptions.build
    if params[:PayerID]
      @subscription.paypal_customer_token = params[:PayerID]
      @subscription.paypal_payment_token = params[:token]
      @subscription.link_count = params[:link_count]
      @subscription.email = @subscription.paypal.checkout_details.email
      @subscription.user_id = current_user.id
    end
  end

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.user_id = current_user.id
    if @subscription.save_with_payment
      redirect_to links_path, :notice => "Thank you for subscribing! No you can short you links"
    else
      render :new
    end
  end

  def paypal_checkout
    plan = Plan.find(params[:plan_id])
    subscription = plan.subscriptions.build
    subscription.link_count = params[:link_count]
    subscription.user_id = current_user.id
    redirect_to subscription.paypal.checkout_url(
      return_url: new_subscription_url(plan_id: plan.id, link_count: params[:link_count]),
      cancel_url: root_url
    )
  end

  private

    def subscription_params
      params.require(:subscription).permit(:plan_id, :paypal_customer_token, :paypal_payment_token, :email, :link_count)
    end
end
