class PhonesController < ApplicationController
  load_and_authorize_resource
  def show
		@voted = false
		if user_signed_in?
			@review = Review.where(user_id: current_user.id, phone_id: @phone.id).first
			unless @review.nil?
				@voted = true
			end
		end
  end
end
