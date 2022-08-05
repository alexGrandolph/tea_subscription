class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  belongs_to :customer
  belongs_to :tea

  enum status: [:Active, :Cancelled]
  enum frequency: [:Weekly, :Monthly]
end 