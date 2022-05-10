class Beer < ApplicationRecord
	validates :beer_type, presence: true, uniqueness: true
	validates :stock, presence: true
	validate :check_beer_type

	before_save :check_beer_type
	before_update :check_beer_type
	before_create :check_beer_type

	def check_beer_type
		# byebug
		unless ['ipa', 'brown_ale', 'pilsner', 'lager', 'lambic', 'hefeweizen'].include?(beer_type.downcase)
			errors.add(:beer_type, "Can't be created/Already Present")
		end
	end

	def to_param
	    beer_type
	end
end
