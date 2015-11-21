class Luhn
  
  # Luhn algorith
  # Step 1 - break the credit card into it's individual digits.
  # Step 2 - Double every second digit, starting from the right-most.
  # Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
  # Step 4 - Sum the digits.
  # Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.
  def self.is_valid?(number)
    
    # Step 1 - break credit card into individual digits
    arr = []
    num = number
    while num / 10 > 1
      arr << num % 10
      num = num / 10
    end
    arr << num
    
    # Step 2 - double every second digit
    # Step 3 - subtract 10
    arr.each_index do |index|
      arr[index] *= 2 if ((index+1) % 2==0)
      arr[index] -= 9 if arr[index] >= 10
    end
    
    # Step 4 - Sum the digits
    final = arr.inject(0) { |sum,n| sum += n }
    
    # Return evaluation of if the sum is divisible by 10
    final % 10 == 0
    
  end
end