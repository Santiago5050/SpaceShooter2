class Laser

  def initialize(x,y)
    @image = Gosu::Image.new('media/images/player/laser.png')
    @x = x
    @y = y - @image.height/2
    @destroy = false
  end

  def destroy!
    @destroy =true
  end

  def destroyed?
    @destroy
  end

  def get_x
    @x
  end

  def get_y
    @y
  end

  def get_width
    @x + @image.width
  end

  def get_height
    @y + @image.height
  end

  def draw
    @image.draw(@x,@y,1)
  end

  def move!
    @x = @x + 10
  end

  def is_out?
    @x > Game::WINDOW_WIDTH
  end
end
