def reverse(input)
 #fail "Not Implemented Error"
  return nil if input.nil?
  
  reversed_str = []
  char_arr = input.chars
  char_arr.length.times do |iterator|
    reversed_str.unshift char_arr[iterator]
  end

  reversed_str.join
end

puts "hello: #{reverse("hello")}"