class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 100}

  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  attachment :profile_image, destroy: false

  has_many :following, class_name: "Relationship", foreign_key: "following_id"
  has_many :following_user, through: :following, source: :following #自分がフォローしている人
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id"
  has_many :follower_user, through: :follower, source: :follower #自分をフォローしている人(フォロワー)

  # フォローしていたらtrueを返す
  def followed?(user)
  	followed_user.include?(user)
  end

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  validates :introduction, length: {maximum: 60}

end
