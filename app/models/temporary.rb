class Temporary < Task
	validates_datetime :ending, :after => :beginning
end