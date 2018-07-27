class Crop
  @@available_crops = ['corn', 'wheat']

  # create accessors
  attr_accessor :crop, :size

  # create the crop selected, give an error if it's not available in the list
  def initialize(crop, size)
    if @@available_crops.include?(crop)
      @crop = crop
      @size = size
    else
      puts "You only have the following seeds available right now:"
      Crop.show_all
    end
  end

  def self.show_all
    @@available_crops.each {|crops| puts "- #{crops.capitalize}" }
  end
end