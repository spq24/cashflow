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

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name  }
    last_name { Faker::Name.last_name  }
    email { Faker::Internet.email  }
   # phone { Faker::PhoneNumber.phone_number }
    password { Faker::Internet.password(8) }
    
  end
end
