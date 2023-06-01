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

  it "can get one customer by its id" do
    get "/api/v1/customers/#{Customer.last.id}"

    parsed = JSON.parse(response.body, symbolize_names: true)
   
    expect(response).to be_successful
    expect(parsed[:first_name]).to eq("Joe")
    expect(parsed[:last_name]).to eq("Smith")
    expect(parsed[:email]).to eq(@customer_1.email)
    expect(parsed[:address]).to eq("123 Main")
  end

  it "can update a customer" do
    customer_params = { first_name: "John", last_name: "Doe", email: "new@email.com"}
    headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }

    patch "/api/v1/customers/#{Customer.last.id}", params: customer_params.to_json, headers: headers

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(parsed[:first_name]).to eq("John")
    expect(parsed[:last_name]).to eq("Doe")
    expect(parsed[:email]).to eq(customer_params[:email])
    expect(parsed[:address]).to eq("123 Main")
  end

  it "can destroy a customer" do
    expect(Customer.count).to eq(1)

    delete "/api/v1/customers/#{Customer.last.id}"

    expect(response).to be_successful
    expect(Customer.count).to eq(0)
    expect{Customer.find(@customer_1.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end


