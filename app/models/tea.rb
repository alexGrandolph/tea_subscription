class Tea < ApplicationRecord
  validates_presence_of :title, :description, :temp, :brewtime


end 