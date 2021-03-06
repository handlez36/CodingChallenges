class LinkedListNode
  attr_accessor :value, :next_node
 
  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
  
end

class Stack
  attr_reader :data

  def initialize
      @data = nil
  end

  # Push a value onto the stack
  def push(value)
    # IMPLEMENT ME!
    new_entry = LinkedListNode.new(value)
    
    if @data.nil?
      @data = LinkedListNode.new(value)
    else
      last_node = find_last_node(@data)
      last_node.next_node = new_entry
    end
    
  end
  
  # Pop an item off the stack.  
  # Remove the last item that was pushed onto the
  # stack and return the value to the user
  def pop
    
    # If stack is empty, return nil
    # If stack only contains one element, return value and set element to nil
    # Otherwise, find the last node in the stack
    if @data.nil?
      return -1
    elsif @data.next_node.nil?
      last_val = @data.value
      @data = nil
    else
      last_node = find_last_node(@data, flag: 1)
      last_val = last_node.value
    end
        
    last_val
  end
  
  # Traverses the stack to find the last node
  # If this is for a pop call (i.e., flag is 1), set the previous element's next node value to nil
  def find_last_node(node, previous_node: nil, flag: 0)
    if node.next_node.nil?
      if flag!=0 && !previous_node.nil?
        previous_node.next_node = nil
      end
      return node
    else
      previous_node = node
      find_last_node(node.next_node, previous_node: previous_node, flag: flag)
    end
    
  end
  
  
  def print_stack
    if !@data.nil?
      printlist(@data)
    else
      puts "No elements in the stack"
    end
  end

end

def printlist(node)
  print "#{node.value} --> "
  if !node.next_node.nil?
    printlist(node.next_node)
  else
    puts "nil"
    return
  end
end

def reverse_list(list)
  stack = Stack.new
  rev = Stack.new
  
  while list
    stack.push list.value
    list = list.next_node
  end
  
  while !stack.data.nil?
    rev.push stack.pop
  end
  
  prev_node = nil
  val = 1
  while(!rev.data.nil?)
    val = rev.pop

    node = LinkedListNode.new(val, prev_node)
    prev_node = node
  end

  node

end

def reverse_inline(node, prev_node = nil)
  first_node = !node.next_node.nil? ? reverse_inline(node.next_node, node) : node
  node.next_node = prev_node
  first_node
end

def loop_in_list(list)
  hare_finish = false
  tortoise_finish = false
  loop = false
  
  hare = list
  tortoise = list
  
  while !hare_finish && !loop
    # Wrap if condition in a method (with explanatory name) and call method
    if hare.next_node.nil? || hare.next_node.next_node.nil?
      hare_finish = true
    else
      hare = hare.next_node.next_node
      tortoise = tortoise.next_node
    end
    
    loop = true if hare == tortoise
  end
    
  loop
  
end

def stack_testing
  stack = Stack.new
  stack.push(5)
  stack.push(8)
  stack.push(2)
  stack.push(11)
  stack.print_stack   # 5 -> 8 -> 2 -> 11
  puts "#1. #{stack.pop}"
  stack.print_stack   # 5 -> 8 -> 2
  puts "#2. #{stack.pop}"
  stack.print_stack   # 5 -> 8
  puts "#3. #{stack.pop}"
  stack.print_stack   # 5
  puts "#4. #{stack.pop}"
  stack.print_stack   # nil
  puts "#5. #{stack.pop}"
  stack.push(123)
  stack.print_stack   # 123 -> nil
  stack.push(143)
  stack.print_stack   # 123 -> 143 -> nil
end


node1 = LinkedListNode.new(8)
node2 = LinkedListNode.new(7, node1)
node3 = LinkedListNode.new(6, node2)
node4 = LinkedListNode.new(5, node3)
node5 = LinkedListNode.new(4, node4)
node6 = LinkedListNode.new(3, node5)
node7 = LinkedListNode.new(2, node6)
node8 = LinkedListNode.new(1, node7)
node1.next_node = node6

#puts "List before: "
#printlist(node7)

#puts "List after (inline):"
#revlist = reverse_inline(node7)
#printlist(revlist)
loop_in_list(node8)