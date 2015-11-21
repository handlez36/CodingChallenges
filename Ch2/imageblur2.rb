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
  
  def blur
    ones = []
    # Add each '1' found to the ones array
    self.img.each_index do |row|
      img[row].each_index do |col|
        ones << [row, col] if img[row][col] == 1  
      end
    end
    
    #Cycle through ones array, and perform transformation
    ones.each do |cell|
      puts cell.inspect
      # Transform cell above
      if cell[0] - 1 >= 0
        self.img[cell[0]-1][cell[1]] = 1
      end
      
      # Transform cell below
      if cell[0] + 1 < self.img.length
        self.img[cell[0]+1][cell[1]] = 1
      end
      
      # Transform cell to the right
      if cell[1] + 1 < self.img[cell[0]].length
        self.img[cell[0]][cell[1]+1] = 1
      end
      
      # Transform cell to the left
      if cell[1] - 1 >= 0
        self.img[cell[0]][cell[1]-1] = 1
      end
      
      
    end
  end
  
end

image = Image.new([
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0],
  [0,0,0,0]
])

image2 = Image.new([
  [0,0,1,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,0,0,0,0],
  [0,0,1,0,0,0]
])

puts "Before..."
image2.output_image
image2.blur
puts "After..."
image2.output_image

#image.output_image
#image2.output_image