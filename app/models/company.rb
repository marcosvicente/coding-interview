# frozen_string_literal: true

# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_name  (name)
#
class Company < ApplicationRecord
  has_many :users, dependent: :destroy_async

  validates :name, presence: true
  validates :name, uniqueness: true

end
