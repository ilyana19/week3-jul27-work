require_relative 'crop'

class Farm < Crop
  # create accessors
  attr_accessor :total_harvest

  def initialize(name)
    @name = name
    @fields = []
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
    when 'exit' then end_game
    end
  end

  # available options/actions
  def create_field
    sleep(1)
    puts "\e[H\e[2J"
    puts "What kind of field is it?"
    puts <<~TEXT
      --------------------
        Available Crops
      --------------------
    TEXT
    Crop.show_all
    puts "--------------------"
    type = gets.chomp.downcase

    print "\nHow large is the field (hectares)? "
    size = gets.to_i

    @fields << Crop.new(type, size) # => add to the field array

    puts "\nAdded a #{type} field of #{size} hectares!"

    sleep(2)
    puts "\nprocessing...".upcase
    puts "\e[H\e[2J"

    # have not added a check for unavailable crops
  end

  def harvest
    sleep(1)
    puts "\e[H\e[2J"
    puts <<~TEXT
      ----------------------
      #{@name} Farm Harvest
      ----------------------
    TEXT

    @fields.each do |crop|
      @total_harvest += crop.yield
      puts "Harvesting #{crop.total_yields} food from #{crop.size} hectare of #{crop.type} field."
    end

    puts ""
    harvested # => call this method at the end to show total harvest

    puts "\nprocessing...".upcase
    sleep(4)
    # puts "\e[H\e[2J"

    # should not be able to harvest if there are no fields available
  end

  def status
    sleep(1)
    puts "\e[H\e[2J"
    puts <<~TEXT
      --------------------
      #{@name} Farm Stats
      --------------------
    TEXT

    @fields.each do |field|
      puts "#{field.type.capitalize} field is #{field.size} hectares."
    end

    harvested
    puts "\nprocessing...".upcase
    sleep(4)
    # puts "\e[H\e[2J"
  end

  # list a description of the fields
  def relax
    sleep(1)
    puts "\e[H\e[2J"
    puts <<~TEXT
      --------------------
            Relaxing
      --------------------
    TEXT

    @fields.each do |field|
      case field.type
      when 'corn'
        puts "#{field.size} hectares of tall green stalks rustling in the breeze fill your horizon."
      when 'wheat'
        puts "The sun hangs low, casting an orange glow on a sea of #{field.size} hectares of wheat."
      end
    end

    puts "\nprocessing...".upcase
    sleep(6)
    puts "\e[H\e[2J"
  end

  def end_game
    puts "\nSee you soon!".upcase
    sleep(4)
    puts "\e[H\e[2J"
    exit
  end

  # creating one because this particular status is being used elsewhere as well.
  def harvested
    puts "#{@name} Farm has #{@total_harvest} harvested food so far."
  end
end