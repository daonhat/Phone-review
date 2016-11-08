class PhonesController < ApplicationController
  load_and_authorize_resource
  def show
		@voted = false
		@review = Review.where(user_id: current_user.id, phone_id: @phone.id).first
		unless @review.nil? 
			@voted = true
		end
  end
end
