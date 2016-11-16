class ReviewsController < ApplicationController
	before_filter :authenticate_user!
	def create
		@review = Review.new review_params
		if @review.save
			result = Phone.average_rate_score params[:review][:phone_id]
			render json: @review.as_json.merge(result)
		else
			empty = Hash.new
			render json: empty.to_json
		end
	end

	def update
		@review = Review.find params[:id]
		if @review.update_attributes rate_review: params[:review][:score]
			result = Phone.average_rate_score params[:phone_id]
			render json: @review.as_json.merge(result)
		else
			empty = Hash.new
			render json: empty.to_json
		end	
	end
	def review_params
		params.require(:review).permit :phone_id, :rate_review, :user_id
	end
end

