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
    @head = Node.new(data, nil)
  end


  def index_at(index)
    current_head = self.head

    index.times do |i|
      return nil unless current_head.next
      current_head = current_head.next
    end
    current_head.data
  end


  def insert_at_index(index, data)
    current_head = self.head

    (1..index - 1).each do |i|
      if (current_head.next.nil?) && (index != i )
        current_head.next = Node.new(nil, nil)
      end
      current_head = current_head.next
    end
    old_next = current_head.next
    current_head.next = Node.new(data, old_next)
  end


  def unshift(data)
    current = head
    self.head = Node.new(data, current)
  end


  def push(new_data)
    current = head

    until current.next.nil?
      current = current.next
    end
    current.next = Node.new(new_data, nil)
    current.next.data
  end


end
