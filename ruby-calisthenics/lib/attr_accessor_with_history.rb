# My student ID is 201528015029031
class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
      	if !defined? @#{attr_name}_history
      		@#{attr_name}_history = [@#{attr_name}]
      	else
      		@#{attr_name}_history << @#{attr_name}
      	end
      	@#{attr_name} = value
      end
    }
  end
end
