class Api::V1::SubscriptionsController < ApplicationController
  
  def index
    @customer = Customer.find(params[:customer_id])
    @subscriptions = @customer.subscriptions.with_deleted
    render json: @subscriptions
  end

  def create
    @customer = Customer.find(params[:customer_id])
    @subscription = @customer.subscriptions.create!(subscription_params)
    render json: @subscription, status: :created
  end

  def update
    @customer = Customer.find(params[:customer_id])
    @subscription = @customer.subscriptions.find(params[:id])
    if @subscription.update(subscription_update_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @subscription = @customer.subscriptions.find(params[:id])
    @subscription.destroy
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end

  def subscription_update_params
    params.permit(:status, :frequency).tap do |whitelisted|
      whitelisted.delete(:status) if params[:status].nil?
      whitelisted.delete(:frequency) if params[:frequency].nil?
    end
  end
end
