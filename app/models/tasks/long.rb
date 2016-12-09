class Long < Task
	before_validation :verify_if_complete, :verify_status, :reset_percentage, on: :update
	before_create :initialize_percentage

	validates_numericality_of :percentage, 
		numericality: {only_float: true},
		greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0,
		presence: true, on: :update, unless: 'status_id_was == 1'

	validates_numericality_of :status_id,
		numericality: {only_integer: true},
		greater_than_or_equal_to: 1, less_than_or_equal_to: 3,
		presence:true, on: :update

	private

		def initialize_percentage
			self.percentage = 0
		end

		def verify_if_complete
			self.status_id = 3 if self.percentage == 100
		end

		def reset_percentage
			if self.status_id == 1
				self.percentage = 0.0
			elsif self.status_id == 3
				self.percentage = 100
			end
		end
end