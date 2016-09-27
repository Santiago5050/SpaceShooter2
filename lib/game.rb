require 'gosu'
require 'csv'

require_relative 'utils'
require_relative 'menu/main_menu'
require_relative "level/level"

class Game < Gosu::Window

  WINDOW_WIDTH = 1024
  WINDOW_HEIGHT = 600

  def initialize
    super(WINDOW_WIDTH, WINDOW_HEIGHT)
    self.caption = "SpaceShooter"
    @main_menu = MainMenu.new(self)
    @current_screen = @main_menu
    @enemy_ships_definitions = load_enemy_ship_definitions
  end

  def draw
    @current_screen.draw
  end

  def button_down(id)
    @current_screen.button_down(id)
  end

  def update
    @current_screen.update
  end

  def show_level
    @current_screen = Level.new(self, @enemy_ships_definitions)
  end

  def show_main_menu
    @current_screen = @main_menu
  end

  def load_enemy_ship_definitions
    file_content = File.read('enemy_ships.csv')
    rows = CSV.parse(file_content)
    rows.map do |row|
      {
        image_path: row[0],
        name: row[1],
        points: row[2].to_i,
        velocity: row[3].to_i
      }
    end
  end

end
