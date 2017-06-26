require 'rails_helper'

RSpec.describe Building, type: :model do
  let!(:building_1) { create(:building) }

  describe "Validations building" do
    it { should validate_presence_of(:name) }
  end

  describe "Factory" do
    it "Creates a valid building" do
      expect(building_1).to be_valid
    end
  end
end
