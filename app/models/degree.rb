class Degree < ApplicationRecord

	has_many :degree_managements, dependent: :destroy
	has_many :users
end
