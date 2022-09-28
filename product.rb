require 'constants'

class Product
	attr_accessor :name, :price, :quantity, :productType, :sales_item

	def initialize(name, price, quantity, productType)
		@name = name
		@price = price
		@quantity = quantity
		@productType = productType
	end

	def imported?
		productType == Constants::PRODUCT_TYPES[3]
	end

	def exempt?
		productType == Constants::PRODUCT_TYPES[2]
	end
end