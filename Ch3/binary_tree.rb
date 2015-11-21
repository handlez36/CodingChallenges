require_relative 'tree-traversal.rb'

class BinaryTree
  attr_accessor :payload, :left, :right
  
  def initialize(payload, left=nil, right=nil)
    @payload = payload
    @left = left
    @right = right
  end
  
end

# Print tree
def print_tree(node, child_of="nobody")
  
  if !node.nil?
    curr_node = node
    puts "curr node is #{curr_node.payload} -- child of #{child_of}"
  
    print_tree(curr_node.left, curr_node.payload.to_s)
    print_tree(curr_node.right, curr_node.payload.to_s)
  end

end

# Build binary tree
def build_tree(arr)
  
  btree = BinaryTree.new(arr.shift)
  
  while !arr.empty?
    
    next_num = arr.shift
    curr_node = btree
    found_a_spot = false
    
    while !found_a_spot
    
      if next_num <= curr_node.payload
      
          if curr_node.left.nil?
            found_a_spot = true
            curr_node.left = BinaryTree.new(next_num)
          else
            curr_node = curr_node.left
          end

      else
          if curr_node.right.nil?
            found_a_spot = true
            curr_node.right = BinaryTree.new(next_num, nil, nil)
          else
            curr_node = curr_node.right
          end
      end
      
    end
    
  end
  
  btree
end

# Binary tree sort
def btree_sort(node, queue, first=true)
  
  queued = false
  if !node.left.nil?
    btree_sort(node.left, queue, false)
  end
  
  if !node.right.nil?
    queue.enqueue(node.payload)
    queued = true
    btree_sort(node.right, queue, false)
  end
  
  queue.enqueue(node.payload) if !queued
  
  queue.to_array if first
  
end

def binary_sort(arr)
  btree_sort(build_tree(arr), Queue.new)
end

arr = [7,4,12,104,4,44,11,1,30,0,98]
puts "Original array: #{arr}"
new_arr = binary_sort(arr)
puts "Sorted array: #{new_arr}"
