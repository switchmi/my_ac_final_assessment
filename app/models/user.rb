class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :notes
  has_many :follower_users, class_name: 'Following', foreign_key: :followee_id
  has_many :followers, through: :follower_users
  has_many :followee_users, class_name: 'Following', foreign_key: :follower_id
  has_many :followees, through: :followee_users
  has_many :likes
  has_many :note_likes, through: :likes
  validates :name, presence: true
  validates :email, presence: true


   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
       user.name = auth.info.name   # assuming the user model has a name
      #  user.image = auth.info.image # assuming the user model has an image
       # If you are using confirmable and the provider(s) you use validate emails,
       # uncomment the line below to skip the confirmation emails.
       # user.skip_confirmation!
     end
   end

   def follow(other_user)
     followees << other_user
   end

   def unfollow(other_user)
     followees.delete(other_user)
   end

   def following?(other_user)
     followees.include?(other_user)
   end

   def feed
     following_ids = "SELECT followee_id FROM followings WHERE follower_id = :user_id"

     Note.where("user_id IN (#{following_ids})
                OR user_id = :user_id", user_id: id)
   end

end
