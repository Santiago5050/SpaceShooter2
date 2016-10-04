class Score

  MARGIN_RIGHT = 120
  MARGIN_TOP = 10

  attr_accessor :points

  def initialize
    @points = 0
    @text = Gosu::Font.new(40, name: Utils.default_font)
  end

  def draw
    @text.draw(@points, Game::WINDOW_WIDTH-MARGIN_RIGHT, MARGIN_TOP,1)
  end

  def update_points!(points)
    @points += points
  end

end
