java_import org.newdawn.slick.geom.Ellipse
java_import org.newdawn.slick.Color

class Thing

  attr_reader :game_zone

  def initialize game_zone
    @game_zone = game_zone
  end

  def draw g
    g.set_color color
    g.draw thing
  end

  def thing
    @thing ||= Ellipse.new game_zone.rand_x, game_zone.rand_y, 20, 20
  end
  alias :box :thing

  def reset
    @thing = Ellipse.new game_zone.rand_x, game_zone.rand_y, 20, 20
  end

  def color
    @color ||= Color.new Color.green
  end
end
