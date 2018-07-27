class Crop
  @@available_crops = ['corn', 'wheat']

  # create accessors
  attr_accessor :type, :size

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

  # calculate yield
  def yield
    self.size * 20 # calling for "this" particular crop
  end
end