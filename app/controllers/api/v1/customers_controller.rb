class Api::V1::CustomersController < ApplicationController
    
  def show
    @customer = Customer.includes(:subscriptions).find(params[:id])
    render json: @customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      render json: @customer, status: :created
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def update
    @customer = Customer.includes(:subscriptions).find(params[:id])
    if @customer.update(customer_params)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.includes(:subscriptions).find(params[:id])
    @customer.destroy
  end
  
  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :address)
  end
end