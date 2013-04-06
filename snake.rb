java_import org.newdawn.slick.geom.Rectangle

class Snake

  TIME_PER_ACTION = 0.10
  UP    = 1
  DOWN  = 2
  LEFT  = 3
  RIGHT = 4

  def initialize
    @rec = [Rectangle.new(200,200,5,5)]
    @last_action = Time.now
    @direction = RIGHT
  end

  def up
    #if @direction != DOWN && action!
    if action!
      r = @rec.last
      @rec << Rectangle.new(r.get_x, r.get_y - 5, 5, 5)
    end
  end

  def down
    if action!
      r = @rec.last
      @rec << Rectangle.new(r.get_x, r.get_y + 5, 5, 5)
    end
  end

  def left
    if action!
      r = @rec.last
      @rec << Rectangle.new(r.get_x - 5, r.get_y, 5, 5)
    end
  end

  def right
    if action!
      r = @rec.last
      @rec << Rectangle.new(r.get_x + 5, r.get_y, 5, 5)
    end
  end

  def draw g
    @rec.each do |r|
      g.draw r
    end
  end

  def action!
    eend = Time.now
    #its in second
    if eend - @last_action > TIME_PER_ACTION
      @last_action = eend
      true
    else
      false
    end
  end
end
