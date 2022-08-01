class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency

  belongs_to :customer
  belongs_to :tea

  enum status: [:active, :cancelled]
  enum frequency: [:weekly, :monthly]
end 