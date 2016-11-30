class Node
  attr_accessor :data, :next

  def initialize(data, next_node = nil)
    @data = data
    @next = next_node
  end
end

class LinkedList
  attr_accessor :head

  def initialize(data)
    @head = Node.new(data)
  end

  def index_at(index)
    pointer = head
    index.times do
      return nil unless pointer.next
      pointer = pointer.next
    end
    pointer.data
  end

  def insert_at_index(index, data)
    pointer = self.head
    (1..index - 1).each do |number|
      if pointer.next.nil? && (index != number)
        pointer.next = Node.new(nil, nil)
      end
      pointer = pointer.next
    end
    if pointer
      old_next = pointer.next
      pointer.next = Node.new(data, old_next)
    end
  end

  def unshift(data)
    pointer = self.head
    self.head = Node.new(data)
    self.head.next = pointer
  end

  def push(data)
    pointer = head
    while pointer.next
      pointer = pointer.next
    end
    pointer.next = Node.new(data, nil)
  end

  # https://www.sitepoint.com/ruby-interview-questions-linked-lists-and-hash-tables/
  def reverse(node)
    return node if node.nil? || node.next.nil?

    next_node = node.next
    new_head = reverse(node.next)
    next_node.next = node
    node.next = nil
    new_head
  end
end
