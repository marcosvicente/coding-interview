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
class User < ApplicationRecord
  belongs_to :company

  scope :by_company, ->(company_id) { where(company_id: company_id) if company_id.present? }
  scope :by_username, lambda { |username|
    where('lower(username) LIKE ?', "%#{username.to_s.downcase}%") if username.present?
  }

  validates :username, :email, presence: true

  after_create :send_email


  def send_email
    CreateUserMailer.send_email(self.email).deliver_now if self.email.nil?
  end
end
