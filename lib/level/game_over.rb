
class GameOver

  def initialize(window, points)
    @window = window
    @text = Gosu::Image.from_text("GAME OVER", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @points = Gosu::Image.from_text("Points: #{@points}", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @text_x = Utils.center_x(@text)
    @text_y = Utils.center_y(@text)
    @points_x = Utils.center_x(@points)
    @points_y = Utils.center_y(@points)
  end

  def draw
    @text.draw(@text_x, @text_y, 1)
    @points.draw(@points_x, @points_y + 100, 1)
  end

  def update
  end

  def button_down(id)
    if id == Gosu::KbEscape
      @window.show_main_menu
    end
  end

end
