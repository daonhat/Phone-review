class ReviewsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@review = Review.new review_params
		if @review.save
			result = Phone.average_rate_score params[:review][:phone_id]
			render json: result.to_json
		end
	end
	def review_params
		params.require(:review).permit :phone_id, :rate_review, :user_id
	end
end

