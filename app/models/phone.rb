class Phone < ApplicationRecord
  ratyrate_rateable "quality"

  has_many :reviews, dependent: :destroy

  belongs_to :user
  belongs_to :category

end
