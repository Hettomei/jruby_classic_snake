$:.push File.expand_path('../lib', __FILE__)

require 'java'
require 'lwjgl.jar'
require 'slick.jar'

require 'snake'
require 'thing'
require 'game_zone'

java_import org.newdawn.slick.BasicGame
java_import org.newdawn.slick.GameContainer
java_import org.newdawn.slick.Graphics
java_import org.newdawn.slick.Input
java_import org.newdawn.slick.SlickException
java_import org.newdawn.slick.AppGameContainer

class GameStart < BasicGame

  def init(container)
    @gz    = GameZone.new
    @snake     = Snake.new @gz
    @thing = Thing.new @gz
  end

  def render(container, graphics)
    @snake.draw graphics
    @gz.draw graphics
    @thing.draw graphics
  end

  def update(container, delta)
    input = container.get_input
    container.exit if input.is_key_down(Input::KEY_ESCAPE)

    if input.is_key_down(Input::KEY_UP)
      @snake.dir_up
    elsif input.is_key_down(Input::KEY_DOWN)
      @snake.dir_down
    elsif input.is_key_down(Input::KEY_LEFT)
      @snake.dir_left
    elsif input.is_key_down(Input::KEY_RIGHT)
      @snake.dir_right
    end

    @snake.update delta
    if @snake.touch? @thing
      @thing = Thing.new @gz
    end
  end

end

app = AppGameContainer.new GameStart.new('Snake')
app.set_display_mode(640, 480, false)
app.start
