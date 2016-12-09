module TypesArrayHelper
	def get_types_array(array)
		array.map{|task| [t(task), task]}
	end
end