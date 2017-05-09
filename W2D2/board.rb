class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_with_index do |cup, idx|
      4.times do cups[idx] << :stone unless idx == 6 || idx == 13
      end
    end
    cups
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 13 || start_pos < 0
    raise 'Invalid starting cup' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    count = cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    while !count.empty?
      i += 1
      i = 0 if i > 13
      if i == 6
        cups[i] << count.pop if current_player_name == @name1
      elsif i == 13
        cups[i] << count.pop if current_player_name == @name2
      else
        cups[i] << count.pop
      end
    end
    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].flatten.empty? || @cups[7..12].flatten.empty?
      return true
    end
    false
  end

  def winner
    if @cups[6] == @cups[13]
      return :draw
    else
      return @name1 if @cups[6].count > @cups[13].count
      return @name2 if @cups[13].count > @cups[6].count
    end
  end
end
