class Post < ApplicationRecord

	acts_as_taggable_on :tags
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :post_comments, dependent: :destroy
	attachment :image

	validates :title, presence: true
	validates :body, presence: true
	validates :start_time, presence: true

	# すでにいいねしたかどうかを判断する
	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end

    def self.search(search)
      if search
      	Post.where(['title LIKE ? OR body LIKE ?', "%#{search}%", "%#{search}%"])
      else
      	Post.all
      end
    end
end
