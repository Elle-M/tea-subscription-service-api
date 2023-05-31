require "rails_helper"

describe "Customers Subscriptions API" do
  before :each do
    @customer = create(:customer)
    @tea = create(:tea)
  end
  
  it "can create a subscription for a customer" do
    @subscription_params = { title: "Subscription 1", price: 5.00, status: "active", frequency: 1, customer_id: @customer.id, tea_id: @tea.id }.to_json
    post "/api/v1/customers/#{@customer.id}/subscriptions", params: @subscription_params, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
    
    parsed = JSON.parse(response.body, symbolize_names: true)
 
    expect(response).to be_successful
    expect(parsed[:title]).to eq("Subscription 1")
    expect(parsed[:price]).to eq(5.00)
    expect(parsed[:status]).to eq("active")
    expect(parsed[:frequency]).to eq("1")
    expect(parsed[:customer_id]).to eq(@customer.id)
    expect(parsed[:tea_id]).to eq(@tea.id)
  end

  it "can get all subscriptions for a customer" do
    subscription_1 = Subscription.create!(title: "Subscription 1", price: 5.00, status: "active", frequency: 1, customer_id: @customer.id, tea_id: @tea.id)
    subscription_2 = Subscription.create!(title: "Subscription 2", price: 5.00, status: "active", frequency: 1, customer_id: @customer.id, tea_id: @tea.id)

    get "/api/v1/customers/#{@customer.id}/subscriptions"

    parsed = JSON.parse(response.body, symbolize_names: true)
 
    expect(response).to be_successful
    expect(parsed[0][:title]).to eq("Subscription 1")
    expect(parsed[0][:price]).to eq(5.00)
    expect(parsed[0][:status]).to eq("active")
    expect(parsed[0][:frequency]).to eq("1")
    expect(parsed[0][:customer_id]).to eq(@customer.id)
    expect(parsed[0][:tea_id]).to eq(@tea.id)
    expect(parsed[1][:title]).to eq("Subscription 2")
    expect(parsed[1][:price]).to eq(5.00)
    expect(parsed[1][:status]).to eq("active")
    expect(parsed[1][:frequency]).to eq("1")
    expect(parsed[1][:customer_id]).to eq(@customer.id)
    expect(parsed[1][:tea_id]).to eq(@tea.id)
  end
end  