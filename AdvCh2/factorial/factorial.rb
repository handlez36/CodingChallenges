module Factorial

  def self.of(number)
    return 1 if number == 0
    return nil if number.nil?
    
    fact = 1
    number.times { |n| fact *= n+1 }
    fact
    
  end


end
