class Node
  attr_accessor :data, :next_node

  def initialize(data, next_node = nil)
    @data = data
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  # returns the last node in the LL
  def tail
    if self.head.next_node
      node = self.head.next_node
      while node.next_node
        node = node.next_node
      end
      node
    else
      self.head
    end
  end

  # takes an index and returns data at that index
  def index_at(index)
    pointer = head
    index.times do
      return nil unless pointer.next_node
      pointer = pointer.next_node
    end
    pointer.data
  end

  # inserts given data at given index
  def insert_at_index(index, data)
    pointer = self.head
    (1..index - 1).each do |number|
      if pointer.next_node.nil? && (index != number)
        pointer.next_node = Node.new(nil, nil)
      end
      pointer = pointer.next_node
    end
    if pointer
      old_next = pointer.next_node
      pointer.next_node = Node.new(data, old_next)
    end
  end

  # adds a new node to the front of the LL (aka prepend)
  def unshift(data)
    old_head = self.head
    self.head = Node.new(data)
    self.head.next_node = old_head
  end

  # removes a node from the front of the LL and returns it
  def shift
    binding.pry
    shifted_node = self.head
    self.head = self.head.next_node
    shifted_node
  end

  # add to the end of the LL (aka append)
  def push(data)
    pointer = self.head
    while pointer.next_node
      pointer = pointer.next_node
    end
    pointer.next_node = Node.new(data, nil)
  end

  # removes a node from the end of the LL and returns it
  # only pops if LL is > 2 elements in length
  def pop
    if self.head.next_node
      node = self.head.next_node
      while node.next_node.next_node
        node = node.next_node
      end
      poppedNode = node.next_node
      node.next_node = nil
      return poppedNode
    else
      return nil
    end
  end

  # https://www.sitepoint.com/ruby-interview-questions-linked-lists-and-hash-tables/
  def reverse(node)
    return node if node.nil? || node.next_node.nil?

    next_node = node.next_node
    new_head = reverse(node.next_node)
    next_node.next_node = node
    node.next_node = nil
    new_head
  end
end
