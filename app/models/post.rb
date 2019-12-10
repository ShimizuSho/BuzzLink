class Post < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :folder_contents, dependent: :destroy
	has_many :favorites
	belongs_to :user
	# belongs_to :folder, optional: true

  validates :post_title, presence: true, length: { maximum: 50 }
  validates :link, presence: true, length: { maximum: 110 }
  validates :post_body, presence: true, length: { maximum: 1000 }

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
  	if search
    		Post.where(['post_title LIKE ?', "%#{search}%"])
  	else
    		Post.all
  	end
  end
end
