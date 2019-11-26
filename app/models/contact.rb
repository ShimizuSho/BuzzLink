class Contact < ApplicationRecord
	belongs_to :user
	validates :contact_body, presence: true, length: { maximum: 100 }
end
