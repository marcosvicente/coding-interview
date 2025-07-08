class UsersController < ApplicationController

  def index
    users = User
              .by_company(params[:company_identifier])
              .by_username(search_params[:username])
    render json: users.all
  end


  def tweets
    @tweets = Tweet
                .get_cursor(tweet_params[:cursor])
                .page(paginate_tweets[:page])
                .per(paginate_tweets[:per_page])

    get_cursor(@tweets)
  end

  private

    def find_user_id_params
      params.permit(:user_id)
    end
    def search_params
      params.permit(:username)
    end
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
