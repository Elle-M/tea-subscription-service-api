class Subscription < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :customer
  belongs_to :tea

  validates :title, :price, :status, :frequency, presence: true

  enum status: [:active, :cancelled]

  def cancel
    return if cancelled?

    self.status = :cancelled
    save
  end
end