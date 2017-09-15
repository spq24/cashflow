# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           default("")
#  last_name              :string           default("")
#  auth_token             :string           default("")
#

require 'rails_helper'

RSpec.describe User, type: :model do
	it "should have a valid factory" do
		expect(build(:user)).to be_valid
	end

	describe User do
		before { @user = create(:user) }

		it { should have_many :categories }
		it { should have_many :sub_categories }
		it { should have_many :transactions }
		it { should validate_presence_of :email }
		it { should validate_presence_of :password }
		it { should validate_uniqueness_of :auth_token }

	  	context "#generate_authentication_token!" do
		    it "generates a unique token" do
		      Devise.stub(:friendly_token).and_return("auniquetoken123")
		      @user.generate_authentication_token!
		      expect(@user.auth_token).to eq "auniquetoken123"
		    end

		    it "generates another token when one already has been taken" do
		      existing_user = create(:user, auth_token: "auniquetoken123")
		      @user.generate_authentication_token!
		      expect(@user.auth_token).not_to eq existing_user.auth_token
		    end
	  	end

	  	context "#full_name" do
	  		it "returns the full name of the user" do
	  			user = create(:user, first_name: "Steve", last_name: "Quatrani")
	  			expect(user.full_name).to eq "Steve Quatrani"
	  		end
	  	end
	end
end
