require 'minitest/autorun'
require_relative 'longest_subsequence'

class LongestSubsequenceTest < Minitest::Test
  def test_nil_case
  	longest = LongestSubsequence.find(nil, nil)
  	assert_equal nil, longest
  end

  def test_no_common_subsequences
  	longest = LongestSubsequence.find("a", "b")
  	assert_equal nil, longest
  end

  def test_short_string
  	longest = LongestSubsequence.find("ABCDAF", "ACBCF")
  	assert_equal "ABCF", longest.chars.sort.join
  end



end
