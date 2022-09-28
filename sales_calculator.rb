require 'json'
require_relative 'receipt'

class SalesCalculator
	def greeting
		puts "===========================Welcome to the TORC Sales Calculator!==========================="
	end

	def start
		greeting
		puts "Please enter the number of the file you would like to calculate the sales tax for."
		input_case = gets.chomp.to_i

		if input_case > 0 && input_case < 4
			file = File.read("inputs/input_#{input_case}.json")
			data_hash = JSON.parse(file)

			Receipt.print_receipt(data_hash)
		else
			puts "Oops! That's not a valid input. Please try again with numbers between 1 and 3."
			start
		end
	end
end

sales_calculator = SalesCalculator.new
sales_calculator.start