class MovieRating < ApplicationRecord
  # belongs_to method specifies a one to one relationship
  # tile options specifies that one title has one rating
  belongs_to :title
  # validates method specifies that a movie is valid only if 
  # a title id is present
  validates :title, presence: true
end
