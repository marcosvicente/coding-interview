# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_tweets_on_body     (body)
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Tweet < ApplicationRecord
  belongs_to :user

  validates :body, presence: true

  scope :get_cursor, lambda { |cursor|
    where('created_at < ?', Time.at(cursor.to_i)).order(created_at: :desc) if cursor.present?
  }
end
