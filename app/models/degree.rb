class Degree < ApplicationRecord

	has_many :users, through: :degree_management
	has_many :degree_management
end
