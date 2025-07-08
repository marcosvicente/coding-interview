class TweetsController < ApplicationController
  def index
    @tweets = Tweet
                .order(paginate_tweets[:order])
                .page(paginate_tweets[:page])
                .per(paginate_tweets[:per_page])
  end

  private
  def paginate_tweets
    params.permit(
      :page, :per_page, :order
    )
  end
end
