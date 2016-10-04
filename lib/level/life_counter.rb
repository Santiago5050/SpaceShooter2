class LifeCounter

  MARGIN_TOP = 10
  MARGIN_LEFT = 10
  MARGIN_INTERNAL_X = 10

  def initialize
    @lives = 5
    @image = Gosu::Image.new('media/images/power.png')
    @lost_life_sound = Gosu::Sample.new('media/sounds/lost_life.ogg')
  end

  def draw
    @lives.times do |posicion|
      x = MARGIN_LEFT + posicion * (@image.width + MARGIN_INTERNAL_X)
      @image.draw(x, MARGIN_TOP, 1)
    end
  end

  def lose_life!
    @lives -= 1
    @lost_life_sound.play
  end

  def game_over?
    @lives == 0
  end

end
