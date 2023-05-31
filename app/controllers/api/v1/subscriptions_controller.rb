class Api::V1::SubscriptionsController < ApplicationController
  def index
    @subscriptions = Subscription.all
    render json: @subscriptions
  end

  def create
    @subscription = Subscription.new(subscription_params)
    if @subscription.save
      render json: @subscription, status: :created
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:customer_id, :tea_id, :title, :price, :status, :frequency)
  end
end
