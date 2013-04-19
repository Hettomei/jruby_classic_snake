require 'stucks'

java_import org.newdawn.slick.geom.Rectangle

class Snake

  DELTA_BEFORE_ACTION = 100
  UP    = 1
  DOWN  = 2
  LEFT  = 3
  RIGHT = 4

  def initialize game_zone
    @game_zone = game_zone
    init
  end

  def init
    @stucks = Stucks.new @game_zone
    @current_direction = RIGHT
    @next_direction = RIGHT
    @total_delta = 0
    @new_tail = false
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

  def up
    @stucks.new_up
  end

  def down
    @stucks.new_down
  end

  def left
    @stucks.new_left
  end

  def right
    @stucks.new_right
  end

  def draw g
    @stucks.draw g
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

      if new_tail?
        @new_tail = false
      else
        @stucks.remove_last
      end

      @total_delta = 0
      @current_direction = @next_direction
      init if @stucks.colision?
    end
  end

  def touch? thing
    if @total_delta == 0
      return true if @stucks.head.touch? thing
    end
    false
  end

  def new_tail
    @new_tail = true
  end

  def new_tail?
    !!@new_tail
  end
end
