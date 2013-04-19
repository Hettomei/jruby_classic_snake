java_import 'java.util.Random'

java_import org.newdawn.slick.geom.Rectangle

class GameZone

  def initialize
    @x = 20 * 5
    @y = 10 * 5
    @size = 80 * 5
  end

  def draw g
    g.set_color color
    g.draw rect
  end

  def x
    @x
  end
  alias :left :x

  def y
    @y
  end
  alias :up :y

  def right
    @bx ||= rect.get_max_x
  end

  def bottom
    @by ||= rect.get_max_y
  end
  alias :down :bottom

  def center_x
    @cx ||= rect.center_x
  end

  def center_y
    @cy ||= rect.center_y
  end

  def rand_x
    rand(left, right)
  end

  def rand_y
    rand(up, down)
  end

  def contains? object
    rect.contains object.x, object.y
  end

  def rect
    @rect ||= Rectangle.new(@x, @y, @size, @size)
  end

  def color
    @color ||= Color.new Color.blue
  end

  private

  def rand min, max
    (@rand ||= Random.new).next_int(max - min + 1) + min
  end
end
