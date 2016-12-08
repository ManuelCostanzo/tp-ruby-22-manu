module SourceHashHelper
	def get_source_hash(array, type)
		arr = []
		array.each do |e|
			arr << {'value'=> e.id, 'text' => e.name} unless (e.name == 'En curso' and type != 'Long') or (e.name == 'Expirada' and type != 'Temporary')
		end
		arr
	end
end