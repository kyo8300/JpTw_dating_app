class User < ApplicationRecord
  enum sex: { female: 0, male: 1}
  enum nationality: { japan: 0, taiwan: 1}
  enum occupation: {student: 0, doctor: 1, accountant: 2, financial: 3, agriculture: 4, computer: 5, architecture: 6, consaltant: 7,
                    nurse: 8, manager: 9, publicworker: 10, sports: 11, entertainer: 12, writer: 13, designer: 14, education: 15, food: 16, 
                    acception: 17, government: 18, pharmacy: 19, pilot: 20, loyer: 21, ca: 22, media: 23, tourisum: 24, service: 25, estate: 26,
                    welfare: 27, secretary: 28, beauty: 29, trading: 30, enterprise: 31, liberal: 32, ceo: 33 ,other: 34}
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  validates :username, presence: true
  validates :height, numericality: { only_integer: true, greater_than_or_equal_to: 130, less_than_or_equal_to: 200 }
  validates :singleword, length: {maximum: 100}
  
  def calage
    date_format = "%Y%m%d"
    (Date.today.strftime(date_format).to_i - birth.strftime(date_format).to_i) / 1000
  end  
end
