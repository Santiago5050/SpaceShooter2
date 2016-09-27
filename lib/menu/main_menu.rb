require_relative "menu_options"

class MainMenu
OPTIONS_MARGIN_TOP = 200
MARGIN_INTERNAL_Y = 80
OPTIONS = {play: 0,exit: 1}
  def initialize(window)
    @title = Gosu::Image.from_text("Menu Principal", Utils::FONT_SIZE_BIG, font: Utils.default_font)
    @x = Utils.center_x(@title)
    @window = window
    @options = []
    ["jugar","salir"].each_with_index do |text, index|
      option_y = OPTIONS_MARGIN_TOP + (index * MARGIN_INTERNAL_Y)
      @options << MenuOption.new(text, option_y)
    end
    @current_option = OPTIONS[:play]
  end

  def draw
    @title.draw(@x,0,0)
    @options.each do |option|
      is_selected = option == @options[@current_option]
      option.draw(is_selected)
    end
  end

  def move_dif_option
    if @current_option == OPTIONS[:play]
      @current_option = OPTIONS[:exit]
    else
      @current_option = OPTIONS[:play]
    end
  end

  def select_option
    case @current_option
    when OPTIONS[:play]
      @window.show_level
    when OPTIONS[:exit]
      @window.close
    end
  end

  def update
    
  end

  def button_down(id)
    case id
    when Gosu::KbEscape
      @window.close
    when Gosu::KbUp , Gosu::KbDown , Gosu::KbW , Gosu::KbS
      move_dif_option
    when Gosu::KbSpace , Gosu::KbReturn
      select_option
    end
  end
end
