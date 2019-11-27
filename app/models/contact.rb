class Contact < ApplicationRecord
	validates :contact_body, presence: true, length: { maximum: 100 }
end
