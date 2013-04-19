require 'stuck'

class Stucks

  def initialize game_zone
    @game_zone = game_zone
    @size = 5

    @stucks = [Stuck.new(@game_zone.x, @game_zone.y, @size)]
    5.times do
      new_right
    end
  end

  def new_up
    last = @stucks.last
    s = Stuck.new(last.x, last.y - last.size, @size)
    if @game_zone.contains? s
      @stucks << s
    else
      @stucks << Stuck.new(last.x, @game_zone.bottom - last.size, @size)
    end
  end

  def new_down
    last = @stucks.last
    s = Stuck.new(last.x, last.y + last.size, @size)
    if @game_zone.contains? s
      @stucks << s
    else
      @stucks << Stuck.new(last.x, @game_zone.up, @size)
    end
  end

  def new_left
    last = @stucks.last
    s = Stuck.new(last.x - last.size, last.y, @size)
    if @game_zone.contains? s
      @stucks << s
    else
      @stucks << Stuck.new(@game_zone.right - last.size, last.y, @size)
    end
  end

  def new_right
    last = @stucks.last
    s = Stuck.new(last.x + last.size, last.y, @size)
    if @game_zone.contains? s
      @stucks << s
    else
      @stucks << Stuck.new(@game_zone.left, last.y, @size)
    end
  end

  def remove_last
    @stucks.shift
  end

  def draw g
    @stucks.each do |s|
      s.draw g
    end
  end

  def colision?
    #we only test the last element against all
    last = @stucks.last
    @stucks.take(count - 1).find do |s|
      last.equal s
    end
  end

  def count
    @stucks.count
  end
end
