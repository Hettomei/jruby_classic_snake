$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

require 'snake'
require 'mur'

java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class Start < BasicGame

  def init(container)
    @s = Snake.new
    @m = Mur.new
  end

  def render(container, graphics)
    @s.draw graphics
    @m.draw graphics
  end

  def update(container, delta)
    input = container.get_input
    container.exit if input.is_key_down(Input::KEY_ESCAPE)

    if input.is_key_down(Input::KEY_UP)
      @s.dir_up
    elsif input.is_key_down(Input::KEY_DOWN)
      @s.dir_down
    elsif input.is_key_down(Input::KEY_LEFT)
      @s.dir_left
    elsif input.is_key_down(Input::KEY_RIGHT)
      @s.dir_right
    end

    @s.update delta
  end

end

app = AppGameContainer.new Start.new('Snake')
app.set_display_mode(640, 480, false)
app.start
