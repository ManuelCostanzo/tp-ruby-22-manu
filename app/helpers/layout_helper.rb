module LayoutHelper
	def class_for_index
		'class=container' if !current_page?(action: 'index')
	end
end