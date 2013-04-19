java_import org.newdawn.slick.geom.Rectangle

class Stuck

  def initialize x, y, size
    @x = x
    @y = y
    @size = size
  end

  def x
    @x
  end

  def y
    @y
  end

  def rect
    @rect ||= Rectangle.new x, y, size, size
  end

  def size
    @size
  end

  def equal other
    x == other.x && y == other.y
  end

  def draw g
    g.set_color color
    g.draw rect
  end

  def color
    @color ||= Color.new Color.white
  end

  def touch?(thing)
    rect.intersects thing.box
  end

end
