class EnemyShip

  def initialize(image_path, points, velocity)
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::WINDOW_WIDTH
    @y = Random.rand(Game::WINDOW_HEIGHT - @image.height)
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def moove!
    @x -= @velocity
  end

end
