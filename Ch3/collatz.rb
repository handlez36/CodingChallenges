def collatz(num)
  final = []
  
  final << num
  length = 1
  
  while num != 1
    num = num.even? ? num / 2 : 3*num+1
    final << num
    length += 1
  end
  
  #puts "Sequence: #{final.inspect}, ( -- #{length} -- )"
  length
end

num_of_times = 1000000
longest = 0
num = 0

num_of_times.times do |n|
  
  if collatz(n+1) > longest
    longest = collatz(n+1)
    num = n+1
  end
end

puts "Longest index of #{num_of_times} is #{num}"
#puts "f(837799) = #{collatz(837799)}"
#collatz(20)

