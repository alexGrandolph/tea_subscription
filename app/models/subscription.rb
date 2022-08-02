class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency

  belongs_to :customer
  belongs_to :tea

  enum status: [:Active, :Cancelled]
  enum frequency: [:Weekly, :Monthly]
end 