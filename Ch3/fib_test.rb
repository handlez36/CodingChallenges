require 'minitest/autorun'
require_relative 'fib.rb'

class TestFib < MiniTest::Test
  def test_fib_recursive
    assert_equal( 0, recursive_fib(0))
    assert_equal( 1, recursive_fib(1))
    assert_equal( 1, recursive_fib(2))
    assert_equal( 2, recursive_fib(3))
    assert_equal( 3, recursive_fib(4))
    assert_equal( 5, recursive_fib(5))
    assert_equal( 8, recursive_fib(6))
    assert_equal( 13, recursive_fib(7))
    assert_equal( 21, recursive_fib(8))
    assert_equal( 34, recursive_fib(9))
    assert_equal( 55, recursive_fib(10))
    assert_equal( 89, recursive_fib(11))
    assert_equal( 144, recursive_fib(12))
    assert_equal( 233, recursive_fib(13))
    assert_equal( 377, recursive_fib(14))
  end
  
  def test_fib_iterative
    assert_equal( 0, iterative_fib(0))
    assert_equal( 1, iterative_fib(1))
    assert_equal( 1, iterative_fib(2))
    assert_equal( 2, iterative_fib(3))
    assert_equal( 3, iterative_fib(4))
    assert_equal( 5, iterative_fib(5))
    assert_equal( 8, iterative_fib(6))
    assert_equal( 13, iterative_fib(7))
    assert_equal( 21, iterative_fib(8))
    assert_equal( 34, iterative_fib(9))
    assert_equal( 55, iterative_fib(10))    
  end
end

