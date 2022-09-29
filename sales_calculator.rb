require 'json'
require_relative 'receipt'
require_relative 'product'

class SalesCalculator
	def greeting
		puts "=============================Welcome to the TORC Sales/Tax Calculator!============================="
	end

	def main
		greeting
		
		puts 'Do you want to calculate sales tax manually (y) or with the examples (n)? (y/n)'
		choice = gets.chomp.downcase

		if choice == 'y'
			manual
		end
		
		if choice == 'n'
			puts "Please enter the number of the file you would like to calculate the sales tax for."
			input_case = gets.chomp.to_i
			
			if (1..3).include?(input_case)
				puts "="*100
				puts "OUTPUT: #{input_case}"
				puts "="*100
				file = File.read("inputs/input_#{input_case}.json")
				input_data = JSON.parse(file)
				
				receipt = Receipt.new
				input_data.each do |product|
					@product = Product.new(product["name"], product["price"], product["quantity"], product["exempt"], product["imported"])
					receipt.add_to_receipt(@product)
				end
				receipt.print_receipt
			else
				puts "Oops! That's not a valid input. Please try again with numbers between 1 and 3."
				main
			end
		end
	end
end

sales_calculator = SalesCalculator.new
sales_calculator.main