class LargestPrimeFactor
  require 'prime'

  def largest_prime_of(number)
    return nil if number.nil?
    
    largest = 0
    flag = false
    
    # Loop through all numbers less than the number passed in
    number.times do |num|
      num += 1
      flag = false if num == 1
      
      # Is a factor
      if number % num == 0 && number != num
        # is number a prime?
        num.times do |n|
          n += 1
          if num % n == 0 && (n != 1 && n != num)
            flag = true
          end
        end
        
        #flag = true if Prime.prime? num

        largest = num if !flag
      end
      
      flag = false
    end
    
    largest
  end
  
end
