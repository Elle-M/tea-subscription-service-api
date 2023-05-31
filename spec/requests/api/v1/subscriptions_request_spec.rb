require "rails_helper"

describe "Subscriptions API" do
  it "can create a subscription" do
    customer = create(:customer)
    subscription_params = { customer_id: customer.id, tea_id: 1, title: "Subscription 1", price: 10, status: "active", frequency: "monthly" }

    post "/api/v1/subscriptions", params: subscription_params

    subscription = Subscription.last

    expect(response).to be_successful
    expect(subscription.customer_id).to eq(customer.id)
    expect(subscription.tea_id).to eq(1)
  end
end