module Constants
	SALES_TAX_RATE = 0.10
	IMPORT_TAX_RATE = 0.05
	ROUNDING_FACTOR = 0.05
	
	PRODUCT_TYPES = {
		"GOODS" => 1,
		"EXEMPT" => 2,
		"IMPORTED" => 3
	}

	def self.round_up( value )
		( value / ROUNDING_FACTOR ).ceil * ROUNDING_FACTOR
	end
end