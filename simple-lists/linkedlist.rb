class LinkedList

  attr_accessor :head

  def initialize(data)
    @head = Node.new(data, nil)
  end

  def index_at(index)
    current_node = self.head

    index.times do
      current_node = current_node.next
      break if !current_node
    end
    if current_node
      current_node.data
    else
      nil
    end
  end

  def node_at(index)
    current_node = self.head

    index.times do
      current_node = current_node.next
      break if !current_node
    end
     current_node
  end


  # def insert_at_index(index, data)
  #   start_node = self.node_at(index - 1)
  #   if start_node
  #     next_node = start_node.next
  #     insert = Node.new(data, next_node)
  #     start_node.next = insert
  #   else
  #     start_node = self.head
  #     index.times do
  #       current_node = start_node.next
  #       if current_node == nil
  #         current_node = Node.new(nil, nil)
  #         start_node.next = current_node
  #       end
  #     end
  #   end
  # end


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
    current_pointer = self.head
    self.head = Node.new(data, nil)
    self.head.next = current_pointer
  end

  def push(data)
    current_pointer = head
    while current_pointer.next
      current_pointer = current_pointer.next
    end
    current_pointer.next = Node.new(data, nil)
  end
end
