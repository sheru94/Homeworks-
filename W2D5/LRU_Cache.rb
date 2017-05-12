class LRUCache

    def initialize(size = 2)
      @array = []
      @size = size
    end

    def count
      # returns number of elements currently in cache
      @array.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      if @array.include?(el)
        @array.delete(el)
        @array << el
      elsif @array.length == size
        @array.shift
        @array << el
      else
        @array << el unless @array.include?(el)
      end 
    end

    def show
      # shows the items in the cache, with the LRU item first
      @array
    end

    private
    # helper methods go here!

  end
