$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

require 'snake'

java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class Start < BasicGame

  def init(container)
    @s = Snake.new
  end

  def render(container, graphics)
    @s.draw graphics
  end

  def update(container, delta)
    input = container.get_input
    container.exit if input.is_key_down(Input::KEY_ESCAPE)

    if input.is_key_down(Input::KEY_UP)
      @s.up
    elsif input.is_key_down(Input::KEY_DOWN)
      @s.down
    elsif input.is_key_down(Input::KEY_LEFT)
      @s.left
    elsif input.is_key_down(Input::KEY_RIGHT)
      @s.right
    end

  end

end

app = AppGameContainer.new Start.new('Snake')
app.set_display_mode(640, 480, false)
app.start
