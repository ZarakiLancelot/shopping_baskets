class Product
	attr_accessor :name, :price, :quantity, :sales_item

	def initialize(name, price, quantity)
		@name = name
		@price = price
		@quantity = quantity
	end
end