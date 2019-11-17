class Post < ApplicationRecord

	has_many :comments, dependent: :destroy
	has_many :folder_contents
	has_many :favorites
	belongs_to :user
	belongs_to :folder, optional: true

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
