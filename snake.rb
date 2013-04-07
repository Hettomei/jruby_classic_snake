require 'stuck'

java_import org.newdawn.slick.geom.Rectangle

class Snake

  DELTA_BEFORE_ACTION = 1000
  UP    = 1
  DOWN  = 2
  LEFT  = 3
  RIGHT = 4

  def initialize game_zone
    @game_zone = game_zone
    init
  end

  def init
    @rec = init_rec
    @current_direction = RIGHT
    @next_direction = RIGHT
    @total_delta = 0
  end

  def init_rec
    a = []
    x = @game_zone.center_x
    y = @game_zone.center_y
    6.times do
      a << Stuck.new(x, y)
      x += 5
    end
    a
  end

  def dir_up
    @next_direction = UP if @current_direction != DOWN
  end

  def dir_down
    @next_direction = DOWN if @current_direction != UP
  end

  def dir_left
    @next_direction = LEFT if @current_direction != RIGHT
  end

  def dir_right
    @next_direction = RIGHT if @current_direction != LEFT
  end

  def remove_last
    @rec.shift
  end

  def up
    r = @rec.last
    @rec << Stuck.new_up(r)
    remove_last
  end

  def down
    r = @rec.last
    @rec << Stuck.new_down(r)
    remove_last
  end

  def left
    r = @rec.last
    @rec << Stuck.new_left(r)
    remove_last
  end

  def right
    r = @rec.last
    @rec << Stuck.new_right(r)
    remove_last
  end

  def draw g
    @rec.each do |r|
      g.draw r.rect
    end
  end

  def update delta
    @total_delta += delta
    if @total_delta > DELTA_BEFORE_ACTION
      case @next_direction
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
      @current_direction = @next_direction
      init if colision?
    end
  end

  def colision?
    #we only test the last element against all
    l = @rec.last
    @rec.detect do |r|
      r.x == l.x &&
        r.y == l.y &&
        r != l
    end
  end

end
