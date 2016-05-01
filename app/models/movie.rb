class Movie < ApplicationRecord
  # when movie deleted, its reviews are too
  has_many :reviews, dependent: :destroy
end
