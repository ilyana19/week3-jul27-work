class Crop
  @@available_crops = ['corn', 'wheat']
  @@total_yields = 0 # making it class variable so it's usable by class methods too

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
  end

  def self.show_all
    @@available_crops.each {|type| puts "- #{type.capitalize}" }
  end

  # add a new type of crop only if it's not in the farm's stock of seeds
  def buy(type)
    @@available_crops << type if !@@available_crops.include?(type)
  end

  # calculate yield
  def yield
    ###
    # use the index of the array (+1) then generate a random number from 1 to 6
    # multiply that with the size of the fiel
    # save the total in a variable to return that
    ###
    p yields = (@@available_crops.index(@type) + 1) * Random.rand(1..6)
    p @@total_yields = yields * self.size

    return @@total_yields
  end
end