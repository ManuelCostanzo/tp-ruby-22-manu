class Long < Task
	validates_numericality_of :percentage, :on => :edit
	validates :percentage, inclusion: 1..100, presence: true, :on => :edit
end