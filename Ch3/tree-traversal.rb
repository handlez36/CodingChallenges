class Tree
  attr_accessor :payload, :children

  def initialize(payload, children)
    @payload = payload
    @children = children
  end

end

class Queue
  
  def initialize
    @queue = []
  end
  
  def enqueue(num)
    @queue.push(num)
  end
  
  def dequeue
    @queue.shift if @queue.length > 0
  end
  
  def empty?
    @queue.empty?
  end
  
  def to_array
    @queue
  end
  
end

def depth_first_search(num, node)
  
  result = nil
  
  if num == node.payload
    return node
  else
    node.children.length.times do |n|
      result = depth_first_search(num, node.children[n])
      return result if !result.nil?
    end
  end
  
  result
end

def breadth_first_search(num, node)
  queue = Queue.new
  queue.enqueue(node)
  
  while !queue.empty?
    curr_node = queue.dequeue
    if curr_node.payload == num
      return curr_node
    else
      curr_node.children.each_index do |n|
        queue.enqueue(curr_node.children[n])
      end
    end
  end
  
  nil
  
end

# The "Leafs" of a tree, elements that have no children
fifth_node    = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])


# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
fifth_node = Tree.new(5, [ninth_node])

# The "Trunk" of the tree
trunk   = Tree.new(2, [seventh_node, fifth_node])

puts "Finding 12 (DPS): #{depth_first_search2(12, trunk).inspect}"
puts "Finding 12 (BFS): #{breadth_first_search(12, trunk).inspect}"

