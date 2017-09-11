require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  it "should have a valid factory" do
  	expect(build(:sub_category)).to be_valid
  end

  it { should belong_to :user }
  it { should belong_to :category }
  it { should validate_presence_of :name }
end
