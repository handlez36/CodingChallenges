require 'minitest/autorun'
require_relative 'luhn'

class TestLuhn < MiniTest::Test
  def test_luhn_valid
    assert Luhn.is_valid?(4194560385008504)
  end

  def test_luhn_invalid
    assert ! Luhn.is_valid?(4194560385008505)
  end
end