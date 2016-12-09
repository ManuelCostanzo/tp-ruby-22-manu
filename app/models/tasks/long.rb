class Long < Task
	before_validation :verify_if_complete, :verify_status, :reset_percentage, on: :update

	validates_numericality_of :percentage, 
		numericality: {only_float: true},
		greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0,
		presence: true, on: :update, unless: 'status_id_was == 1'

	validates_numericality_of :status_id,
		numericality: {only_integer: true},
		greater_than_or_equal_to: 1, less_than_or_equal_to: 3,
		presence:true, on: :update

	private
		def verify_if_complete
			self.status_id = 3 if self.percentage == 100
		end

		def reset_percentage
			self.percentage = 0 if self.status_id == 1
		end
end