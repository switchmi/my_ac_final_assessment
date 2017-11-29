class Note < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :user_likes, through: :likes
end
