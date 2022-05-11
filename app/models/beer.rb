class Beer < ApplicationRecord
	validates :beer_type, presence: true, uniqueness: true
	validates :stock, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validate :check_beer_type

	before_save :check_beer_type
	before_update :check_beer_type
	before_create :check_beer_type

	def check_beer_type
		# byebug

		beertype= ['ipa', 'brown_ale', 'pilsner', 'lager', 'lambic', 'hefeweizen', 'IPA', 'BROWN_ALE', 'PILSNER', 'LAGER', 'LAMBIC', 'HEFEWEIZEN' ]

		unless beertype.include?(beer_type.downcase)
			errors.add(:beer_type, "Can't be created/Already Present")
		end
	end

	def to_param
	    beer_type
	end
end
