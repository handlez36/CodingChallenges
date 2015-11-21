require 'benchmark'

def recursive_fib(num, last_num = 1)
  if num > 1
    result = recursive_fib(num-1, 0)
    
    if last_num == 1
      return result[0]+result[1]
    else
      return [result[0]+result[1], result[0]]
    end
  else
    if last_num == 1
      return num
    else
      return [1,0]
    end
  end
end

def iterative_fib(num)
  # 0, 1, 2, 3, 4, 5, 6, 7 , 8 , 9
  # 0, 1, 1, 2, 3, 5, 8, 13, 21, 34
  
  
  fib_tbl = []
  
  if num == 0 || num == 1
    fib_tbl << num
    return fib_tbl.last
  end
  
  num.times do |n|
    if n < 3
      fib_tbl << n
    else
      fib_tbl << fib_tbl[n-1] + fib_tbl[n-2]
    end
  end
  
  return fib_tbl.last
end

def recursive_fib2(num)
  if num < 2 
    return num
  else
    return recursive_fib2(num-1) + recursive_fib2(num-2)
  end
  
end

#puts "Answer 1: #{recursive_fib(35)}"
#puts "Answer 2: #{recursive_fib2(35)}"

num = 37
Benchmark.bm do |x|
  x.report("recursive_fib") { recursive_fib(num) }
  x.report("iterative_fib") { iterative_fib(num) }
  x.report("recursive_fib2") { recursive_fib2(num) }
end