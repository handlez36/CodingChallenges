def calculate( *numbers, operation)
  #puts "Numbers are: #{numbers} -- Operations is: #{operation}"

  if operation.is_a? Hash
    if( (operation[:add] && operation[:add] == true) || !operation.present?)
      add(*numbers)
    else
      subtract(*numbers)
    end
  else
    numbers << operation
    puts "Number is a: #{numbers.is_a? Array}"
    add(*numbers)
  end

  #add(*numbers)
end

def calculate2( *arguments )
  nums = []
  options = {}
  arguments.each do |arg|
    if arg.is_a? Hash
      options = arg
    else
      nums << arg
    end
  end
  
  if( options.empty? || options[:add] == true)
    add(*nums)
  else
    subtract(*nums)
  end
  
end

def add(*numbers)
  final = numbers.inject(0) { |sum, n| sum + n }
  puts "Add final: #{final}"
  final
end

def subtract(*numbers)
  final = 0
  numbers.each_index do |n|
    if(n==0)
      final = numbers[n]
    else
      final = final - numbers[n]
    end
    
  end
  
  puts "Sub final: #{final}"
  final
end

def calculations
  calculate2(4,5)
  calculate2(4,5, :add => true)
  calculate2(-10,2,3, :add => true)
  calculate2(0,0,0,0, :add => true)
  calculate2(4,5,:subtract => true)
  calculate2(-10,2,3, :subtract => true)
  calculate2(0,0,0,0,-10, :subtract => true)
end

def print_pair(a,b,*)
  puts "#{a} and #{b} and #{c}"
end

print_pair 1,2,3,:cake,7



arr = [1,2,3,4,5]
arr.each {|n| print n.to_s + " "}
puts