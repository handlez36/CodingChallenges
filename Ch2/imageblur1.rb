class Image
  attr_accessor :img
  attr_reader :test
  
  def initialize(img_array)
    $stdout.sync = true
    self.img = img_array
    @test = "Brandon"
  end
  
  def test_method
    puts "#{@test}"
  end
  
  def output_image
    puts "Length is #{self.img.length}"
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
  
end

image = Image.new([
  [0,0,0,0],
  [0,1,0,0],
  [0,0,0,1],
  [0,0,0,0]
])

image2 = Image.new([1])

#image.output_image
#image2.output_image
image.test_method
puts " From the outside: #{image.test}"