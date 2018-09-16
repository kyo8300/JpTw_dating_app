class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_one  :profile, dependent: :destroy
  
  def following?(other_user)
    following.include?(other_user)
  end  
  
  def follow(other_user)
    self.active_relationships.create(following_id: other_user.id)
  end
  
  def matchers
    following & followers
  end
end

