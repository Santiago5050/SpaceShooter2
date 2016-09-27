module Utils

  FONT_SIZE_BIG = 90
  TEXT_COLOR_LIGHT = Gosu::Color.new(255*0.30,0, 187,51)
  TEXT_COLOR= Gosu::Color.new(255,0,187,51)

  def self.default_font
    'media/fonts/letra.ttf'
  end

  def self.center_x(object)
    (Game::WINDOW_WIDTH / 2) - (object.width / 2)
  end

  def self.center_y(object)
    (Game::WINDOW_HEIGHT / 2) - (object.height / 2)
  end
end
