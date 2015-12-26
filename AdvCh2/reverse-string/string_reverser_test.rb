require 'minitest/autorun'
require_relative 'string_reverser'

class StringReverseTest < Minitest::Test
  def test_reverse_nil_case
    assert_equal nil, StringReverser.reverse(nil)
  end

  def test_reverse_short_string
    assert_equal "olleh", StringReverser.reverse("hello")
  end

  def test_reverse_long_string
    assert_equal ".emit yllej rettub tunaep s'tI", StringReverser.reverse("It's peanut butter jelly time.")
  end
end
