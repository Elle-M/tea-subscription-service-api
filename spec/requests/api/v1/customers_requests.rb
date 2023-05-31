require "rails_helper"

describe "Customers API" do
  it "can create a customer" do
    customer_params = { first_name: "Joe", last_name: "Smith", email: "email@email.com", address: "123 Main"}

    post "/api/v1/customers", params: customer_params

    customer = Customer.last

    expect(response).to be_successful
    expect(customer.first_name).to eq(customer_params[:first_name])
    expect(customer.last_name).to eq(customer_params[:last_name])
    expect(customer.email).to eq(customer_params[:email])
    expect(customer.address).to eq(customer_params[:address])
  end

  it "can create a customer" do
    customer = create(:customer)
    customer_params = { first_name: "Joe", last_name: "Smith", email: "email@email.com", address: "123 Main"}

    post "/api/v1/customers", params: customer_params

    expect(response).to be_successful
  end
end

