# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  display_name :string
#  email        :string
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  company_id   :integer
#
# Indexes
#
#  index_users_on_company_id                           (company_id)
#  index_users_on_display_name_and_username_and_email  (display_name,username,email)
#
# Foreign Keys
#
#  company_id  (company_id => companies.id)
#
FactoryBot.define do
  factory :user do
    display_name { Faker::Name.name }
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    company { create(:company) }
  end
end
