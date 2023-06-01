require "rails_helper"

describe Subscription, type: :model do
  describe "relationships" do
    it { should belong_to :customer }
    it { should belong_to :tea }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :status }
    it { should validate_presence_of :frequency }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values([:active, :cancelled]) }
  end

  describe "instance methods" do
    it "can cancel a subscription" do
      customer = create(:customer)
      tea = create(:tea)
      subscription = Subscription.create!(title: "Subscription 1", price: 5.00, status: "active", frequency: 1, customer_id: customer.id, tea_id: tea.id)

      expect(subscription.status).to eq("active")

      subscription.cancel

      expect(subscription.status).to eq("cancelled")
    end
  end
end