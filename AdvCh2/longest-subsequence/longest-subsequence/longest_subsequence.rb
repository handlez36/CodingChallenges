module LongestSubsequence

  # ADBCDAF and ACBCF
  # ADBCDAF and DCBCF
  def self.find(first, second)
    return nil if first.nil? || second.nil?
    sub = []
    last = -1
        
    first.chars.each_with_index do |char, n|
      match_indexes = []
      second.chars.each_with_index { |second_char, i| match_indexes << i if second_char == char }
      if match_indexes.count > 0
        
        match_indexes.each do |match|
          if match > last
            sub << char 
            last = match
            break
          end
        end
        
      end
      
    end
    
    puts "Common substring - custom:  #{sub.join}" 
    return (sub.nil? || sub.empty?) ? nil : sub.join
  end
  
  def self.find2(first, second)
        
    first = first.chars.unshift("O").join
    second = second.chars.unshift("O").join
    
    common_arr = Array.new(second.chars.length){Array.new(first.chars.length)}
    
    # Initialize and build two dimensional array
    second.chars.each_with_index do |s_char, s_index|
      first.chars.each_with_index do |f_char, f_index|
        if s_index == 0
          # Fill top row with 0's
          common_arr[s_index][f_index] = 0  
        else
          if f_index == 0
            # Fill leftmost column with 0's 
            common_arr[s_index][f_index] = 0
          else
            # If row vs col characters equal each other, take top, left quadrant + 1
            if first.chars[f_index] == second.chars[s_index]
              common_arr[s_index][f_index] = common_arr[s_index-1][f_index-1] + 1
              # Else, take the biggest of cell to the left vs cell above
            else
              common_arr[s_index][f_index] = (common_arr[s_index-1][f_index] <= common_arr[s_index][f_index-1]) ? common_arr[s_index][f_index-1] : common_arr[s_index-1][f_index]
            end
          end
          
        end
      end
    end
    
    # Backtrack to find characters
    new_arr = []
    build_string(second.chars.length-1, first.chars.length-1, common_arr, new_arr, first)
    puts "Common substring - dynamic: #{new_arr.reverse!.join}"
    
    common_arr.each do |i|
      #puts i.join
    end
  end
  
  def self.build_string(row, col, arr, new_str, first)
    
    if arr[row][col] != 0
      if arr[row][col-1] == arr[row][col]
        # Try to go left
        build_string(row, col-1, arr, new_str, first) if (col-1) >= 0
      elsif arr[row-1][col] == arr[row][col]
        # Try to go up
        build_string(row-1, col, arr, new_str, first) if (row-1) >= 0
      else
        # Build bridge
        new_str << first.chars[col]#arr[row][col]
        build_string(row-1, col-1, arr, new_str, first) if (col-1 >= 0 && row-1 >= 0)
      end
    end
    
    new_str
    
  end
  
  find("BDCABA", "ABCBDAB")
  find2("BDCABA", "ABCBDAB")

end
