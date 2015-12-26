require 'minitest/autorun'
require_relative 'largest_prime_factor'

class LargestPrimeFactorTest < Minitest::Test
  def test_nil_case
    number = nil
    find = LargestPrimeFactor.new
  	largestprime = find.largest_prime_of(number)
  	assert_equal nil, largestprime
  end

  def test_small_number
    number = 10
    find = LargestPrimeFactor.new
  	largestprime = find.largest_prime_of(number)
  	assert_equal 5, largestprime
  end

  def test_large_number
    number = 13195
    find = LargestPrimeFactor.new
  	largestprime = find.largest_prime_of(number)
  	assert_equal 29, largestprime
  end

end
