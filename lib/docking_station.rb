require './lib/bike.rb'

class DockingStation
  attr_accessor_with_default :bike_inventory,0
  # def initialize
  #   @bike_inventory=bike_inventory
  # end
  def release_bike
    Bike.new
  end
  def docking(bike)
    bike_inventory+=1
  end
  def inventory
    bike_inventory
  end
end
