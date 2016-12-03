class Long < Task
	validates_numericality_of :value, :on => :edit
end