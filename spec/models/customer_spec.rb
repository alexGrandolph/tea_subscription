require 'rails_helper'

RSpec.describe Customer type: :model do
  describe "Validations" do

    it { should_validate_presence_of :first_name }
    it { should_validate_presence_of :last_name }
    it { should_validate_presence_of :email }
    it { should_validate_presence_of :address }
    it { should validate_uniqueness_of(:email) }





  end 
end