# Using the Array's built in sort methods isn't allowed!
class Array
  def sort!
  	if caller.inspect.include?("array_utils.rb")
	    raise "You dirty cheater!"
	else
		super
	end
  end

  def sort
  	if caller.inspect.include?("array_utils.rb")
	    raise "You dirty cheater!"
	else
		super
	end
  end
end