java_import org.newdawn.slick.geom.Rectangle

class GameZone

  def initialize
    @x = 100
    @y = 50
  end

  def draw g
    g.draw rect
  end

  def center_x
    rect.center_x
  end

  def center_y
    rect.center_y
  end

  def rect
    @rect ||=  Rectangle.new(@x, @y, 400, 400)
  end
end
