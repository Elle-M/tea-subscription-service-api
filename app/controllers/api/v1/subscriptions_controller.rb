class Api::V1::SubscriptionsController < ApplicationController
  
  def index
    @customer = Customer.find(params[:customer_id])
    @subscriptions = @customer.subscriptions
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

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end
