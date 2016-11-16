class PhonesController < ApplicationController
  load_and_authorize_resource
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
