require 'minitest/autorun'
require_relative 'uniques'

class UniquesTest < Minitest::Test

  def test_nil_case
    arr = []
    assert_equal [], Uniques.cleanup(arr)
  end

  def test_array
    arr = [1,5,"frog",2,1,3,"frog"]
    assert_equal [1,5,"frog",2,3], Uniques.cleanup(arr)
  end

end
