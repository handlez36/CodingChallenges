class Image
  attr_accessor :img
  
  def initialize(img_array)
    $stdout.sync = true
    self.img = img_array
  end
  
  def output_image
    if self.img.length < 1
      puts "Image array is empty"
      return
    end
    
    if !self.img[0].is_a? Array
      puts "Image is in the wrong format"
      return
    end
    
    self.img.each_index do |row|
      img[row].each_index do |col|
        print self.img[row][col]
      end
      puts "\n"
    end
  end
    
  def blur(d)
    ones = mark_ones
    
    ones.each do |cell|
      current_row = cell[0]
      current_col = cell[1]
      vertical_mods = d+1
      vertical_mods.times do |n|
        update_horizontally(d-n, current_row+n, current_col) if (current_row+n>=0 && current_row+n < self.img.length)
        update_horizontally(d-n, current_row-n, current_col) if (current_row-n>=0 && current_row-n < self.img.length)
      end
    end
    
  end
  
  def update_horizontally(num, row, col)
    self.img[row][col] = 1
    num.times do |x|
      # Change cells to the left
      left_col = col - (x+1)
      self.img[row][left_col] = 1 if left_col >= 0

      # Change cells to the right
      right_col = col + (x+1)
      self.img[row][right_col] = 1 if right_col < self.img[row].length
    end  
  end
  
  def mark_ones
    ones = []
    # Add each '1' found to the ones array
    self.img.each_index do |row|
      img[row].each_index do |col|
        ones << [row, col] if img[row][col] == 1  
      end
    end
    ones
  end
  
end

image = Image.new([
  [0,0,0,0],
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,0]
])

image2 = Image.new([
  [1,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,1,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,0],
  [0,0,0,0,0,0,0,0,1]
])

puts "Before..."
image.output_image
image.blur(2)
puts "After..."
image.output_image

#image.output_image
#image2.output_image