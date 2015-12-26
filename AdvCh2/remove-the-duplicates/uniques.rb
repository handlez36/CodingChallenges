module Uniques

  def self.cleanup(array)
    return nil if array.nil?
    return nil if !array.is_a? Array
    
    new_arr = []
    array.each do |val|
      new_arr << val if !new_arr.include? val
    end
    return new_arr
  end

end
