java_import org.newdawn.slick.geom.Rectangle

class Snake

  DELTA_BEFORE_ACTION = 20
  UP    = 1
  DOWN  = 2
  LEFT  = 3
  RIGHT = 4

  def initialize
    @rec = init_rec
    @direction = RIGHT
    @total_delta = 0
  end

  def init_rec
    a = []
    x = 50
    y = 200
    40.times do
      a << Rectangle.new(x,y,5,5)
      x += 5
    end
    a
  end

  def dir_up
    @direction = UP if @direction != DOWN
  end

  def dir_down
    @direction = DOWN if @direction != UP
  end

  def dir_left
    @direction = LEFT if @direction != RIGHT
  end

  def dir_right
    @direction = RIGHT if @direction != LEFT
  end

  def remove_last
    @rec.shift
  end

  def up
    r = @rec.last
    @rec << Rectangle.new(r.get_x, r.get_y - 5, 5, 5)
    remove_last
  end

  def down
    r = @rec.last
    @rec << Rectangle.new(r.get_x, r.get_y + 5, 5, 5)
    remove_last
  end

  def left
    r = @rec.last
    @rec << Rectangle.new(r.get_x - 5, r.get_y, 5, 5)
    remove_last
  end

  def right
    r = @rec.last
    @rec << Rectangle.new(r.get_x + 5, r.get_y, 5, 5)
    remove_last
  end

  def draw g
    @rec.each do |r|
      g.draw r
    end
  end

  def update delta
    @total_delta += delta
    if @total_delta > DELTA_BEFORE_ACTION
      case @direction
      when UP
        up
      when DOWN
        down
      when LEFT
        left
      when RIGHT
        right
      end
      @total_delta = 0
      loose if check_colision
    end
  end

  def check_colision
    #we only test the last element against all
    l = @rec.last
    @rec.detect do |r|
      r.x == l.x and
        r.y == l.y and
        r != l
    end
  end

  def loose
    @rec = init_rec
    @direction = RIGHT
    @total_delta = 0
  end
end
