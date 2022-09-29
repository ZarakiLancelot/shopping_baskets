require_relative 'product'

class Receipt
	def initialize
		@products = []
		@tax_total = 0.0
		@product_total = 0.0
	end

	def add_to_receipt(product)
		product.calculate_tax
		@product_price = 
		@products << product
		
		@tax_total += product.rounding_nearest(product.tax * product.quantity)
		@product_total += product.rounding_nearest((product.price + product.tax) * product.quantity)
	end

	def print_receipt
		@products.each do |product|
			puts "#{product.quantity} #{product.name}: #{product.rounding_nearest((product.price + product.tax) * product.quantity)}"
		end

		puts "Sales Taxes: #{@tax_total.round(2)}"
		puts "Total: #{@product_total}"
	end
end