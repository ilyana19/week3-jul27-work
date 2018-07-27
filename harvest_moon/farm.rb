require_relative 'crop'

class Farm < Crop
  def initialize(name)
    @name = name
    @field = []
    @total_harvest = 0
  end

  def display_menu
    puts "----------------------------------------"
    puts "Welcome to #{@name} Farm".upcase

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

  # available options/actions
  def create_field
    sleep(2)
    puts "\nWhat kind of field is it?"
    puts <<~TEXT
      --------------------
        Available Crops
      --------------------
    TEXT
    Crop.show_all
    puts "--------------------"
    crop = gets.chomp.downcase

    print "\nHow large is the field (hectares)? "
    size = gets.to_i

    @field << Crop.new(crop, size) # => add to the field array

    puts "\nAdded a #{crop} field of #{size} hectares!"

    sleep(2)

    # have not added a check for unavailable crops
  end

  def harvest
  end

  def status
  end

  def relax
  end
end