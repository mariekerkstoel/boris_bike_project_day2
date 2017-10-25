require './lib/bike.rb'

class DockingStation

  # 'bike' to report on the bikes
  attr_reader :bike

  def release_bike
    raise "there are no bikes left" if @bike==nil
    @bike
  end


  # 'dock' used to store a bike
  def dock(bike)
    @bike = bike
  end






end
