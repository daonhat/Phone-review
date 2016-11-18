class PhonesController < ApplicationController
  load_and_authorize_resource

  def index
    @phones = Phone.page(params[:page]).per 4
    # select phone.*
    # from phone inner join comment on phone.id = comment.phone_id
    # group by phone.id
    # order by count(comment.id), phone.id, ASC
    # limit 10

    # @favorite = Phone.includes(:comments).group(:id).order(count(comments.id), :id, asc)

  end

  def show
    @comment_count = @phone.comments.count
    @comments = @phone.comments.page params[:page]
		@voted = false
		if user_signed_in?
			@review = Review.where(user_id: current_user.id, phone_id: @phone.id).first
			unless @review.nil?
				@voted = true
			end
		end
  end
end
