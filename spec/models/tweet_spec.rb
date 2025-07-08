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
#  index_tweets_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "validate scopes" do
    let!(:tweet_1) { create_list(:tweet, 10) }
    let!(:tweet_2) { create(:tweet, created_at: 10.days.ago) }
    let(:cursor) { Time.now }

    context ".get_cursor" do
      it "should be return value of scope" do
        expect(Tweet.get_cursor(cursor).count).to eq(1)
      end
    end
  end
end
