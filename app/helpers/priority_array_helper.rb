module PriorityArrayHelper
	def get_priority_array(array)
		array.map{|p| [t(p.name), p.id]}
	end
end