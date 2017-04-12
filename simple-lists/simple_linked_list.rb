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

  def index_at(i)
    current = head
    i.times do
      return nil unless current.next
      current = current.next
    end
    current.data
  end

  def insert_at_index(index, data)
    current_pointer = self.head
    (1..index - 1).each do |number|
      if current_pointer.next.nil? && (index != number)
        current_pointer.next = Node.new(nil, nil)
      end
      current_pointer = current_pointer.next
    end
    if current_pointer
      old_next = current_pointer.next
      current_pointer.next = Node.new(data, old_next)
    end
  end

  def unshift(data)
    current = head
    self.head = Node.new(data, current)
  end

  def push(data)
    current = head
    until current.next.nil?
      current = current.next
    end
    current.next = Node.new(data)
  end

end
