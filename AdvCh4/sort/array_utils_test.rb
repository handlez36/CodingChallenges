require 'minitest/autorun'
require_relative 'array'
require_relative 'array_utils'

class ArrayUtilsTest < Minitest::Test
  def test_sort
    assert_equal [], ArrayUtils.sort([])

    input = [1, 9, 4, 2, 99, 18]
    assert_equal [1, 2, 4, 9, 18, 99], ArrayUtils.sort(input)
  end
end