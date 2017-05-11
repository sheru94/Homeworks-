#sluggish octopus
def sluggish(array)
  i,j = 0,0
  while i < array.length
    bool = true
    while j < array.length
      next if j == i
      if array[j].length > array[i].length
        bool = false
      end
      j += 1
    end
    return array[i] if bool = true
    i += 1
  end
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

def dominant(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end

def clever(array)
  largest = array.first
  array.each do |fish|
    if fish.length > largest
      largest = fish
    end
  end
  largest
end

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |el, idx|
    if direction == el
      return idx
    end
  end
end

def constant_dance(direction, tiles_array)
  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }
  tiles_hash[direction]
end
