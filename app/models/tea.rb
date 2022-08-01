class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temp, :brewtime
  
  has_many :subscriptions
  has_many :customers, through: :subscriptions

end 