java_import org.newdawn.slick.geom.Rectangle

class Stuck

  def initialize x, y
    @x = x
    @y = y
    @size = 5
  end

  def self.new_up r
    Stuck.new r.x, r.y - r.size
  end

  def self.new_down r
    Stuck.new r.x, r.y + r.size
  end

  def self.new_left r
    Stuck.new r.x - r.size, r.y
  end

  def self.new_right r
    Stuck.new r.x + r.size, r.y
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
end
