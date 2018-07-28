class Crop
  @@available_crops = ['corn', 'wheat']

  # create accessors
  attr_accessor :type, :size, :total_yields

  # create the crop selected, give an error if it's not available in the list
  def initialize(type, size)
    if @@available_crops.include?(type)
      @type = type
      @size = size
    else
      puts "You only have the following seeds available right now:"
      Crop.show_all
    end
    @total_yields = 0
  end

  def self.show_all
    @@available_crops.each {|type| puts "- #{type.capitalize}" }
  end

  # add a new type of crop only if it's not in the farm's stock of seeds
  # print the result on the screen
  def buy(type)
    if !@@available_crops.include?(type)
      @@available_crops << type
      sleep(1)
      puts "\nHere are your new #{type} seeds."
    else
      sleep(1)
      puts "\nYou already have #{type} seeds."
    end
  end

  # calculate yield
  def yield
    ###
    # use the index of the array (+1) then generate a random number from 1 to 6
    # multiply that with the size of the field
    # save the total in a variable to return that
    ###
    yields = (@@available_crops.index(@type) + 1) * Random.rand(1..6)
    @total_yields = yields * self.size

    return @total_yields
  end

  # check if crop is already available before creating field
  def create_field(type)
    if @@available_crops.include?(type)
      return true
    else
      return false
    end
  end
end