module Constants
	TAX_EXEMPTIONS = [ "food", "books", "medical" ]
	SALES_TAX_RATE = 0.10
	IMPORT_TAX_RATE = 0.05
	ROUNDING_FACTOR = 0.05

	def self.round_up( value )
		( value / ROUNDING_FACTOR ).ceil * ROUNDING_FACTOR
	end
end