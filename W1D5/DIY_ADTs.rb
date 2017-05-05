class Stack
  def initialize
    @stack = []
  end

  def add(el)
    @stack.push(el)
  end

  def remove
    @stack.pop
  end

  def show
    @stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.push(el )
  end

  def dequeue
    @queue.shift
  end

  def show
    @queue
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key,value)
    if !@map.flatten.include?(key)
      @map << [key,value]
    else
      @map.each do |arr|
        if arr.include?(key)
          arr[1] = value
        end
      end
    end
  end

  def lookup(key)
    @map.each do |arr|
      if arr.include?(key)
        return arr[1]
      end 
    end
  end

  def remove(key)
    @map.select {|arr| !arr.include?(key)}
  end

  def show
    @map
  end
end
