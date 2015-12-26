def swap(x, y)
  puts "x: #{x}, y: #{y}"
  
  #x = x+y
  #y = x-y
  #x = x-y
  
  x = x ^ y
  y = x ^ y
  x = x ^ y
  
  puts "x: #{x}, y: #{y}"
end

swap(4,40)

def horizontal_check(x, y, x1, y1)
  until y == y1-1
    y +=1
    if board.piece_on? (x, y)
      return true
    end
  end	
end

class game
  def piece_on? (x, y)
    return !board[x][y].nil?
  end
  
end