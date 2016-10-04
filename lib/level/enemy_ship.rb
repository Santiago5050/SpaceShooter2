class EnemyShip

  def initialize(image_path, points, velocity)
    @points = points
    @velocity = velocity
    @image = Gosu::Image.new("media/images/enemies/#{image_path}")
    @x = Game::WINDOW_WIDTH
    @y = Random.rand(Game::WINDOW_HEIGHT - @image.height)
    @destroy = false
  end

  def points
    @points
  end

  def draw
    @image.draw(@x, @y, 1)
  end

  def moove!
    @x -= @velocity
  end

  def is_out?
    (@x + @image.width) <=0
  end

  def was_hit?(lasers)
    lasers.any? do |laser|
       hit?(laser)
    end
  end

  def destroy!
    @destroy = true
  end

  def destroyed?
    @destroy
  end

  private

  def hit?(laser)
    object_left = @x
    object_right = @x + @image.width
    object_top = @y
    object_bottom = @y + @image.height

    laser_left = laser.get_x
    laser_right = laser.get_width
    laser_top = laser.get_y
    laser_bottom = laser.get_height

    if (laser_top > object_bottom)
      false
    elsif (laser_bottom < object_top)
      false
    elsif (laser_left > object_right)
      false
    elsif (laser_right < object_left)
      false
    else
      laser.destroy!
      true
    end
  end

end
