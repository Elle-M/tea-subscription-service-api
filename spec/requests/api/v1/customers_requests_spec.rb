require "rails_helper"

describe "Customers API" do
  before :each do
    @customer_1 = Customer.create!(first_name: "Joe", last_name: "Smith", email: "email@email.com", address: "123 Main")
  end

  it "can create a customer" do
    customer_params = { customer: @customer_1}.to_json
   
    post "/api/v1/customers", params: customer_params, headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    parsed = JSON.parse(response.body, symbolize_names: true)
  
    expect(response).to be_successful
    expect(parsed[:first_name]).to eq("Joe")
    expect(parsed[:last_name]).to eq("Smith")
    expect(parsed[:email]).to eq("email@email.com")
    expect(parsed[:address]).to eq("123 Main")
  end

  it "can get all customers" do
    customer_2 = Customer.create!(first_name: "Jane", last_name: "Doe", email: "doe@email.com", address: "444 Path")

    get "/api/v1/customers"

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[0][:first_name]).to eq("Joe")
    expect(parsed[0][:last_name]).to eq("Smith")
    expect(parsed[0][:address]).to eq("123 Main")
    expect(parsed[0][:email]).to eq("email@email.com")
    expect(parsed[1][:first_name]).to eq("Jane")
    expect(parsed[1][:last_name]).to eq("Doe")
    expect(parsed[1][:address]).to eq("444 Path")
    expect(parsed[1][:email]).to eq("doe@email.com")
  end
end


