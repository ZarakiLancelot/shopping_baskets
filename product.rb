require_relative 'constants'

class Product
	attr_accessor :name, :price, :quantity, :exempt, :imported, :tax

	def initialize(name, price, quantity, exempt, imported)
		@name = name
		@price = price.to_f
		@quantity = quantity.to_i
		@exempt = exempt
		@imported = imported
		@tax = 0.0
	end

	def imported?
		@imported == true
	end

	def exempt?
		@exempt == true
	end

	def calculate_tax
		if imported? && !exempt?
			@tax = ((@price * Constants::IMPORT_TAX_RATE) + (@price * Constants::SALES_TAX_RATE))
		elsif imported? && exempt?
			@tax = (@price * Constants::IMPORT_TAX_RATE)
		elsif !imported? && !exempt?
			@tax = (@price * Constants::SALES_TAX_RATE)
		else
			@tax = 0.0
		end
	end

	def rounding_nearest(value)
		((Constants::ROUNDING_COEFFICIENT * value) / Constants::ROUNDING_COEFFICIENT).round(2)
	end
end