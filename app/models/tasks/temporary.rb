class Temporary < Task
	validates :beginning, :ending,  presence: true
	validates_datetime :ending, :after => :beginning
end