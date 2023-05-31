require "rails_helper"

describe "Customers Subscriptions API" do
  it "can create a subscription for a customer" do
    customer = create(:customer)
    tea = create(:tea)
    subscription_params = { title: "Subscription 1", price: 5.00, status: "active", frequency: 1, customer_id: customer.id, tea_id: tea.id }
    # binding.pry
    post "/api/v1/customers/#{customer.id}/subscriptions", params: subscription_params
    
    expect(response).to be_successful
    expect(customer.subscriptions.count).to eq(1)
  end
end  