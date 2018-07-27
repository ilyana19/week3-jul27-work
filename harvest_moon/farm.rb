require_relative 'crop'

class Farm < Crop
  def initialize(name)
    @name = name
  end

  def display_menu
    puts "\nWelcome to #{@name} Farm".upcase
    puts <<~TEXT

      --------------------
            Options
      --------------------
      field -> adds a new field
      harvest -> harvests crops and adds to total harvested
      status -> displays some information about the farm
      relax -> provides lovely descriptions of your fields
      exit -> exits the program
      --------------------


    TEXT
  end

  def game_start
    while true # repeat indefinitely
      display_menu
      option = gets.chomp
      selected(option)
    end
  end

  def selected(option)
    case option
    when 'field' then create_field
    when 'harvest' then harvest
    when 'status' then status
    when 'relax' then relax
    when 'exit' then exit
    end
  end
end