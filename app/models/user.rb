class User < ApplicationRecord
  scope :matching, -> user_id { joins("INNER JOIN relationships ON relationships.follower_id = users.id
  INNER JOIN relationships AS r ON relationships.following_id = r.follower_id AND r.following_id = relationships.follower_id").where('relationships.following_id = ?', user_id) }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable
 
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "following_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :following
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_one  :profile, dependent: :destroy
  
  
  has_many :from_messages, class_name: "Message",
            foreign_key: "from_id", dependent: :destroy
  has_many :to_messages, class_name: "Message",
            foreign_key: "to_id", dependent: :destroy
  has_many :sent_messages, through: :from_messages, source: :from
  has_many :received_messages, through: :to_messages, source: :to
  
  
  
  def following?(other_user)
    following.include?(other_user)
  end  
  
  def follow(other_user)
    self.active_relationships.create(following_id: other_user.id)
  end
  
  def unfollow(other_user)
    self.active_relationships.find_by(following_id: other_user.id).destroy
  end  
  
  def matchers
    following & followers
  end
  
  #Send message to other user
  def send_message(other_user, room_id, content)
    from_messages.create!(to_id: other_user.id, room_id: room_id, content: content)
  end  
  
  #Facebook and Google
  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first
 
    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
      user.skip_confirmation!
      user.save
    end
 
    user
  end
  
  
  private
    
    def self.dummy_email(auth)
      "#{auth.uid}-#{auth.provider}@example.com"
    end  
  
end

