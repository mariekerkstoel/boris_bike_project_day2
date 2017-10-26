require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bike

  def release_bike
    raise "there are no bikes left" if @bike==nil
    @bike
  end

  def full?
    @bike != nil
  end

  def dock(bike)
    raise "Docking station full" if full?  
    @bike = bike
  end
end
