require 'minitest/autorun'
require_relative 'palindrome.rb'

class LongestSubstringTest < Minitest::Test
  def test_empty_string
    assert "".palindrome?
  end

  def test_one_letter_string
    assert "a".palindrome?
  end

  def test_racecar
  	assert "racecar".palindrome?
    assert "  race_car   ".palindrome?
    assert "race, car.".palindrome?
  end

  def test_non_palindromes
  	refute "yolo".palindrome?
    refute "swag".palindrome?    
    refute "house".palindrome?    
  end


end
