require_relative 'player_ship'
require_relative 'laser'
require_relative 'score'
require_relative 'life_counter'
require_relative 'enemy_ship'

class Level

  def initialize(window, enemy_ships_definitions)
    @window = window
    @player = PlayerShip.new
    @lasers = []
    @score = Score.new
    @lives = LifeCounter.new
    @enemy_ships = []
    @enemy_ships_definitions = enemy_ships_definitions
  end

  def draw
    @player.draw
    if @lasers != nil
      @lasers.each do |laser|
        laser.draw
      end
    end
    @score.draw
    @lives.draw
    if @lasers != nil
     @enemy_ships.each do |element|
       element.draw
     end
    end
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.show_main_menu
    when Gosu::KbSpace
      laser = @player.shoot
      @lasers << laser
    end
  end

  def update
    if @window.button_down?(Gosu::KbUp) || @window.button_down?(Gosu::KbW)
      @player.move_up!
    elsif @window.button_down?(Gosu::KbDown) || @window.button_down?(Gosu::KbS)
      @player.move_down!
    end
    if @lasers != nil && !@lasers.empty?
      @lasers.each do |laser|
        laser.move!
      end
    end

    create_enemy_ships

    if @enemy_ships != nil && !@enemy_ships.empty?
      @enemy_ships.each do |enemy|
        enemy.moove!
        if enemy.was_hit?(@lasers)
          enemy.destroy!
          @score.update_points!(enemy.points)
        elsif enemy.is_out?
          @lives.lose_life!
          @window.show_game_over(@score.points) if @lives.game_over?
        end
      end
    end

    @enemy_ships.reject! {|ship| ship.is_out? || ship.destroyed? }
    @lasers.reject! {|laser| laser.is_out? || laser.destroyed?}
  end

  private

  def create_enemy_ships
    current_time = Gosu::milliseconds

    if @last_enemy_ship_at.nil? || (@last_enemy_ship_at + time_between_enemy_ships < current_time)
      @last_enemy_ship_at = current_time

      info = @enemy_ships_definitions.sample

      @enemy_ships << EnemyShip.new(info[:image_path], info[:points], info[:velocity])
    end
  end

  def time_between_enemy_ships

    case @score.points
      when 0..1000
        3000

      when 1000..2000
        2000

      else
        1000
    end
  end
end
