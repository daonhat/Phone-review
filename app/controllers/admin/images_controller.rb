class Admin::ImagesController < Admin::BaseController
	def create
		@review = Image.new review_params
		if @review.save
			result = Phone.average_rate_score params[:review][:phone_id]
			render json: @review.as_json.merge(result)
		else
			empty = Hash.new
			render json: empty.to_json
		end
	end

	def destroy
		image = Image.find params['image_id']
		if image.destroy
			render json: {status: 'success'}.as_json
		else
			render json: {status: 'fail'}.as_json
		end
	end

end

