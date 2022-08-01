class Subscription < ApplicationRecord
  validates_presence_of :title, :price, :status, :frequency

  has_many :customers
  has_many :teas

end 