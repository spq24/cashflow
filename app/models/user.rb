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

class User < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
	  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :categories
    has_many :sub_categories
    has_many :transactions

    validates :email, :password, presence: true
    validates :auth_token, uniqueness: true

    before_create :generate_authentication_token!

  	def generate_authentication_token!
  	    begin
  	      self.auth_token = Devise.friendly_token
  	    end while self.class.exists?(auth_token: auth_token)
  	end

    def full_name
      "#{first_name} #{last_name}"
    end

end
