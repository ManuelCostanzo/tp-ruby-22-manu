module LayoutHelper
	def class_for_index
		'class=container' if controller.action_name != 'index' && controller.action_name != 'create'
	end
end