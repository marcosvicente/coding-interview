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
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should belong_to(:company) }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }

  describe 'validate scopes' do
    let!(:company) { create(:company) }
    let!(:user) { create(:user, company_id: company.id) }

    context '.by_company' do
      it 'should be return value of scope' do
        expect(User.by_company(company.id).last).to eq(user)
      end

      it 'should be return value of nil' do
        expect(User.by_company(99_999).last).to be_nil
      end
    end

    context '.by_username' do
      it 'should be return value of scope' do
        expect(User.by_username(user.username).last).to eq(user)
      end

      it 'should be return value of nil' do
        expect(User.by_username(99_999).last).to be_nil
      end
    end
  end
end
