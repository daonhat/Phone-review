class PhonesController < ApplicationController
  load_and_authorize_resource

  def index
    @phones = Phone.page(params[:page]).per 4
    @top_phones = Phone.top_phones.order(created_at: :desc).limit(7)
    @new_phones = Phone.new_phones.limit(10)

  end

  def show
    @favorites = Phone.where("category_id = ?", @phone.category_id).limit(3)
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
