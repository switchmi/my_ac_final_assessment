class Like < ApplicationRecord
  belongs_to :note_likes, class_name: 'Note', foreign_key: :note_id
  belongs_to :user_likes, class_name: 'User', foreign_key: :user_id
end
