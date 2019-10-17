module Accessor

	def attr_accessor_with_history(*names)
		names.each do |name|
			var_name = "@#{name}".to_sym
			history_name = "@#{name}_history".to_sym
			define_method(name) {instance_variable_get(var_name)}
			define_method("#{name}_history".to_sym) {instance_variable_get(history_name)}
			define_method ("#{name}=".to_sym) do |value|
				instance_variable_set(var_name, value)
				instance_variable_set(history_name, []) if instance_variable_get(history_name).nil?
				instance_variable_set(history_name, instance_variable_get(history_name)<< value)
			end
		end
    end
=begin
	def strong_attr_accessor(*attr_names, class_name)
		names.each do |attr_name|
		var_name = "@#{attr_name}.to_sym"
		define_method(attr_name) {instance_variable_get{var_name}}
		define_method("#{var_name}=.to_sym") do |value|
		  raise "class error" if !value.is_a?(class_name)
			instance_variable_set{var_name, value} 
		end
	end
end
end
=end 



    


	class Test
	 extend Accessor
 	 attr_accessor_with_history :a, :b, :c
	end