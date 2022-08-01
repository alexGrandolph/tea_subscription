require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe "Validations" do

    it { should validate_presence_of(:title )}
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:temp) }
    it { should validate_presence_of(:brewtime) }
      
  end 
    describe "Relationships" do

    it { should have_many(:subscriptions) }
    it { should have_many(:customers).through(:subscriptions) }

  end 
end