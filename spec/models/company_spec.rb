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
require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should have_many(:users) }
  it { should validate_presence_of(:name) }
end
