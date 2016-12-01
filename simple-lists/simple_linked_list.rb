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

  # returns total number of nodes in LL (includes head in the count)
  def size
    if self.head.next_node
      node = self.head
      i = 1
      while node.next_node
        node = node.next_node
        i += 1
      end
      return i
    else
      return 1
    end
  end

  # returns true if passed data is in the LL else false
  def contains?(data)
    node = self.head
    while node.next_node
      if node.data == data
        return true
      else
        node = node.next_node
      end
    end
    return false
  end

  # returns the index of the node containing specified data, else nil
  def find(data)
    index = 0
    current_node = self.head
    loop do
      if current_node.data == data
        return index
      else
        break if current_node.next_node.nil?
        current_node = current_node.next_node
        index += 1
      end
    end
    return nil
  end

  # takes an index and returns data at that index
  def index_at(index)
    current_node = head
    index.times do
      return nil unless current_node.next_node
      current_node = current_node.next_node
    end
    current_node.data
  end

  def to_s
    output = ''
    current_node = self.head
    until current_node.nil?
      output += '(' + current_node.data.to_s + ') -> '
      current_node = current_node.next_node
    end
    output += 'nil'
  end

  # ALTER LinkedList

  # inserts given data at given index
  # currently does not insert at head index
  def insert_at_index(index, data)
    current_node = self.head
    (1..index - 1).each do |number|
      if current_node.next_node.nil? && (index != number)
        current_node.next_node = Node.new(nil, nil)
      end
      current_node = current_node.next_node
    end
    if current_node
      old_next = current_node.next_node
      current_node.next_node = Node.new(data, old_next)
    end
  end

  # remove a node at given index, update links of nodes
  def remove_at_index(index)
    return "LL contains only head node" if self.size == 1
    if index == 0
      self.shift
    else
      i = 1
      current_node = self.head.next_node
      previous_node = self.head
      loop do
        break if current_node.nil?
        if index == i
          previous_node.next_node = current_node.next_node
          return 'Node removed'
        else
          previous_node = current_node
          current_node = current_node.next_node
          i += 1
        end
      end
      return 'Index not found'
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
    shifted_node = self.head
    self.head = self.head.next_node
    shifted_node
  end

  # add to the end of the LL (aka append)
  def push(data)
    current_node = self.head
    while current_node.next_node
      current_node = current_node.next_node
    end
    current_node.next_node = Node.new(data, nil)
  end

  # removes a node from the end of the LL and returns it
  def pop
    return "Can't delete head" if self.size == 1
    current_node = self.head
    old_node = nil
    while current_node.next_node
      old_node = current_node
      current_node = current_node.next_node
    end
    tail = current_node
    # "pop" the tail
    old_node.next_node = nil
    return tail
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
