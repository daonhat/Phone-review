class Phone < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  belongs_to :user
  belongs_to :category

  validates :name, presence: true, length: {maximum: 50}
  validates :description, presence: true

  scope :new_phones, ->{order(created_at: :desc)}
  scope :top_phones, ->{order(rate_score: :desc)}


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
