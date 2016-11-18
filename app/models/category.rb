class Category < ApplicationRecord
  has_many :phones, dependent: :destroy
end
