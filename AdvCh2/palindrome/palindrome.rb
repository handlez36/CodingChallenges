class String
	def palindrome?
      return true if self == nil || self == ""
      
      orig_str = self.gsub(/[^a-zA-Z]/, '')
      rev_str = orig_str.chars.reverse.join
      orig_str == rev_str
	end

end