class Phone < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :img, dependent: :destroy

  belongs_to :user
  belongs_to :category

	def self.average_rate_score phone_id
		phone = Phone.find phone_id
		sum_reviews = phone.reviews.sum :rate_review
		reviews_count = phone.reviews.count
		average = sum_reviews / phone.reviews.count
		phone.update_attributes rate_score: average
		result = Hash.new
		result['average'] = average
		result['reviews_count'] = reviews_count
		return result
	end

end
