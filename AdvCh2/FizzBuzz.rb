def fizz_buzz(iterations)
  iterations.times do |time|
    time += 1
    if (time.modulo(3).zero? && time.modulo(5).zero?)
      puts "FizzBuzz"
    elsif (time.modulo(3).zero?)
      puts "Fizz"
    elsif (time.modulo(5).zero?)
      puts "Buzz"
    else
      puts time
    end
  end
end

def fizz_buzz2(iteration)
  iteration.times do |it|
    it += 1
    flag = false
    if it.modulo(3).zero?
      print "Fizz"
      flag = true
    end
    if it.modulo(5).zero?
      print "Buzz"
      flag = true
    end
    print it if !flag
    puts
  end
end


fizz_buzz(20)
fizz_buzz2(20)