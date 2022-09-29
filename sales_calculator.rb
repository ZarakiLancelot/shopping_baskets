require 'json'
require_relative 'receipt'
require_relative 'product'

class SalesCalculator
	def greeting
		puts "=============================Welcome to the TORC Sales/Tax Calculator!============================="
	end

	def examples
		puts 'Which example would you like to run? (1/2/3)'
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
			examples
		end
	end

	def manually
		puts "Please enter the number of products you would like to calculate sales tax for."
		number_of_products = gets.chomp.to_i
		receipt = Receipt.new
		
		number_of_products.times do
			puts "Please enter the name of the product."
			name = gets.chomp
			puts "Please enter the price of the product."
			price = gets.chomp
			puts "Please enter the quantity of the product."
			quantity = gets.chomp
			puts "Is the product exempt from sales tax? (y/n)"
			exempt = gets.chomp.downcase
			puts "Is the product imported? (y/n)"
			imported = gets.chomp.downcase
			
			if exempt == 'y'
				exempt = true
			else
				exempt = false
			end
			
			if imported == 'y'
				imported = true
			else
				imported = false
			end
			
			@product = Product.new(name, price, quantity, exempt, imported)
			receipt.add_to_receipt(@product)
		end
		receipt.print_receipt
	end

	def main
		greeting
		puts 'Do you want to calculate sales tax manually (y) or with the examples (n)? (y/n)'
		choice = gets.chomp.downcase

		case choice
		when 'y'
			manually
		when 'n'
			examples
		else
			puts "Oops! That's not a valid input. Please try again with 'y' or 'n'."
			main
		end
	end
end

sales_calculator = SalesCalculator.new
sales_calculator.main