class TweetsController < ApplicationController
  def index
    @tweets = Tweet
                .get_cursor(tweet_params[:cursor])
                .page(paginate_tweets[:page])
                .per(paginate_tweets[:per_page])

    get_cursor(@tweets)
  end

  private

  def get_cursor(tweets)
    @next_cursor = tweets.last&.created_at&.to_i
  end
  def  tweet_params
    params.permit(
      :cursor
    )
  end
  def paginate_tweets
    params.permit(
      :page, :per_page
    )
  end
end
